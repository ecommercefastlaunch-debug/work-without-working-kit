// Renders a multi-page HTML (each page a .page of 794x1123) to one A4 PDF, plus a PNG per
// page for checking, with WebKit. Also checks that nothing runs past a page's bottom margin.
// Usage (from this folder): swift render-book.swift workbook.html work-without-working-workbook.pdf <png-folder>
import AppKit
import WebKit
import PDFKit

let args = CommandLine.arguments
let htmlURL = URL(fileURLWithPath: args[1]).standardizedFileURL
let pdfURL = URL(fileURLWithPath: args[2])
let pngDir = args.count > 3 ? URL(fileURLWithPath: args[3]) : nil
let W: CGFloat = 794, H: CGFloat = 1123

let checkJS = """
JSON.stringify({
  pages: document.querySelectorAll('.page').length,
  overflow: [...document.querySelectorAll('.page')].map((p, i) => {
    const pr = p.getBoundingClientRect(); let max = 0;
    p.querySelectorAll('*').forEach(e => { if (e.closest('.foot') || e.childElementCount) return; const r = e.getBoundingClientRect(); if (r.height > 0) max = Math.max(max, r.bottom - pr.top); });
    const over = Math.max(max - (H_LIMIT), [...p.querySelectorAll('*')].reduce((m, e) => Math.max(m, e.getBoundingClientRect().right - pr.left - 794), 0));
    return over > 0 ? {page: i + 1, over: Math.round(over)} : null; }).filter(Boolean),
  wrappedLinks: [...document.querySelectorAll('.nb, .link')].filter(e => e.getClientRects().length > 1).map(e => e.textContent),
  fonts: [document.fonts.check('16px Poppins'), document.fonts.check('16px Inter')]
})
""".replacingOccurrences(of: "H_LIMIT", with: "1123 - 50")

class Renderer: NSObject, WKNavigationDelegate {
    let web: WKWebView
    let window: NSWindow
    var count = 1
    override init() {
        web = WKWebView(frame: NSRect(x: 0, y: 0, width: W, height: H), configuration: WKWebViewConfiguration())
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: W, height: H), styleMask: [.borderless], backing: .buffered, defer: false)
        super.init()
        window.contentView = web
        web.navigationDelegate = self
        web.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        web.evaluateJavaScript("document.querySelectorAll('.page').length") { n, _ in
            self.count = (n as? Int) ?? 1
            let total = H * CGFloat(self.count)
            self.window.setContentSize(NSSize(width: W, height: total))
            self.web.frame = NSRect(x: 0, y: 0, width: W, height: total)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { self.capture() }
        }
    }
    func capture() {
        web.evaluateJavaScript(checkJS) { r, _ in
            print("layout:", r ?? "nil")
            self.web.evaluateJavaScript("JSON.stringify([...document.querySelectorAll('a[href]')].map(a => { const r = a.getBoundingClientRect(); return {x: r.x, y: r.y + window.scrollY, w: r.width, h: r.height, href: a.href}; }))") { linksJSON, _ in
                let links = (linksJSON as? String).flatMap { try? JSONSerialization.jsonObject(with: Data($0.utf8)) as? [[String: Any]] } ?? []
                self.renderPage(0, links: links, out: PDFDocument())
            }
        }
    }
    func renderPage(_ i: Int, links: [[String: Any]], out: PDFDocument) {
        if i == count {
            out.write(to: pdfURL)
            print("pdf ok, A4 pages:", out.pageCount)
            NSApp.terminate(nil); return
        }
        let rect = NSRect(x: 0, y: CGFloat(i) * H, width: W, height: H)
        if let dir = pngDir {
            let cfg = WKSnapshotConfiguration(); cfg.rect = rect; cfg.snapshotWidth = NSNumber(value: Double(W))
            web.takeSnapshot(with: cfg) { img, _ in
                if let img = img, let tiff = img.tiffRepresentation, let rep = NSBitmapImageRep(data: tiff),
                   let png = rep.representation(using: .png, properties: [:]) {
                    try? png.write(to: dir.appendingPathComponent(String(format: "page-%02d.png", i + 1)))
                }
            }
        }
        let pcfg = WKPDFConfiguration(); pcfg.rect = rect
        web.createPDF(configuration: pcfg) { result in
            guard case .success(let data) = result,
                  let src = CGPDFDocument(CGDataProvider(data: data as CFData)!),
                  let srcPage = src.page(at: 1) else { print("pdf failed on page", i + 1); NSApp.terminate(nil); return }
            let a4W: CGFloat = 595.28, a4H: CGFloat = 841.89, s = a4W / W
            let buf = NSMutableData()
            var box = CGRect(x: 0, y: 0, width: a4W, height: a4H)
            let ctx = CGContext(consumer: CGDataConsumer(data: buf as CFMutableData)!, mediaBox: &box, nil)!
            ctx.beginPDFPage(nil); ctx.scaleBy(x: s, y: a4H / H); ctx.drawPDFPage(srcPage); ctx.endPDFPage(); ctx.closePDF()
            let one = PDFDocument(data: buf as Data)!
            let page = one.page(at: 0)!
            for l in links {
                let x = l["x"] as! Double, y = (l["y"] as! Double) - Double(i) * Double(H), w = l["w"] as! Double, h = l["h"] as! Double
                if y < 0 || y > Double(H) { continue }
                let r = CGRect(x: x * Double(s), y: Double(a4H) - (y + h) * Double(a4H / H), width: w * Double(s), height: h * Double(a4H / H))
                let ann = PDFAnnotation(bounds: r, forType: .link, withProperties: nil)
                ann.url = URL(string: l["href"] as! String); ann.border = PDFBorder(); ann.border?.lineWidth = 0
                page.addAnnotation(ann)
            }
            out.insert(page, at: out.pageCount)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { self.renderPage(i + 1, links: links, out: out) }
        }
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.prohibited)
let renderer = Renderer()
DispatchQueue.main.asyncAfter(deadline: .now() + 90) { print("timeout"); NSApp.terminate(nil) }
app.run()
