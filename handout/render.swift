// Renders handout.html to an A4 PNG (2x) and PDF with WebKit, and checks the layout.
// Usage (from this folder): swift render.swift handout.html work-without-working-kits.png work-without-working-kits.pdf
import AppKit
import WebKit
import PDFKit

let args = CommandLine.arguments
let htmlURL = URL(fileURLWithPath: args[1]).standardizedFileURL
let pngURL = URL(fileURLWithPath: args[2])
let pdfURL = URL(fileURLWithPath: args[3])
let W: CGFloat = 794, H: CGFloat = 1123

// Layout checks: no box overflows, and no link or path (.nb, .link) wraps or sticks out.
let checkJS = """
JSON.stringify({
  height: document.documentElement.scrollHeight,
  overflowingBoxes: [...document.querySelectorAll('.kit, .rules')].filter(e => e.scrollHeight > e.clientHeight + 1).length,
  wrappedLinks: [...document.querySelectorAll('.nb, .link')].filter(e => e.getClientRects().length > 1).map(e => e.textContent),
  linksSticking: [...document.querySelectorAll('.nb, .link')].filter(e => e.getBoundingClientRect().right > e.closest('.prompt, header').getBoundingClientRect().right).map(e => e.textContent),
  poppins: document.fonts.check('16px Poppins'),
  inter: document.fonts.check('16px Inter')
})
"""

class Renderer: NSObject, WKNavigationDelegate {
    let web: WKWebView
    let window: NSWindow
    override init() {
        web = WKWebView(frame: NSRect(x: 0, y: 0, width: W, height: H), configuration: WKWebViewConfiguration())
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: W, height: H), styleMask: [.borderless], backing: .buffered, defer: false)
        super.init()
        window.contentView = web
        web.navigationDelegate = self
        web.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { self.capture() }
    }
    func capture() {
        web.evaluateJavaScript(checkJS) { r, _ in
            print("layout:", r ?? "nil")
            let cfg = WKSnapshotConfiguration()
            cfg.rect = NSRect(x: 0, y: 0, width: W, height: H)
            cfg.snapshotWidth = NSNumber(value: Double(W * 2))
            self.web.takeSnapshot(with: cfg) { img, err in
                if let img = img, let tiff = img.tiffRepresentation, let rep = NSBitmapImageRep(data: tiff),
                   let png = rep.representation(using: .png, properties: [:]) {
                    try? png.write(to: pngURL); print("png ok", rep.pixelsWide, "x", rep.pixelsHigh)
                } else { print("png failed", err as Any) }
                // PDF: render at full size (same layout as the PNG), then scale the vector
                // page down to true A4 and put the clickable links back.
                self.web.evaluateJavaScript("JSON.stringify([...document.querySelectorAll('a[href]')].map(a => { const r = a.getBoundingClientRect(); return {x: r.x, y: r.y, w: r.width, h: r.height, href: a.href}; }))") { linksJSON, _ in
                    let pcfg = WKPDFConfiguration()
                    pcfg.rect = NSRect(x: 0, y: 0, width: W, height: H)
                    self.web.createPDF(configuration: pcfg) { result in
                        guard case .success(let data) = result,
                              let src = CGPDFDocument(CGDataProvider(data: data as CFData)!),
                              let srcPage = src.page(at: 1) else { print("pdf failed"); NSApp.terminate(nil); return }
                        let a4W: CGFloat = 595.28, a4H: CGFloat = 841.89, s = a4W / W
                        let out = NSMutableData()
                        var box = CGRect(x: 0, y: 0, width: a4W, height: a4H)
                        let ctx = CGContext(consumer: CGDataConsumer(data: out as CFMutableData)!, mediaBox: &box, nil)!
                        ctx.beginPDFPage(nil)
                        ctx.scaleBy(x: s, y: a4H / H)
                        ctx.drawPDFPage(srcPage)
                        ctx.endPDFPage()
                        ctx.closePDF()
                        let doc = PDFDocument(data: out as Data)!
                        let page = doc.page(at: 0)!
                        if let str = linksJSON as? String, let arr = try? JSONSerialization.jsonObject(with: Data(str.utf8)) as? [[String: Any]] {
                            for l in arr {
                                let x = (l["x"] as! Double), y = (l["y"] as! Double), w = (l["w"] as! Double), h = (l["h"] as! Double)
                                let rect = CGRect(x: x * Double(s), y: Double(a4H) - (y + h) * Double(a4H / H), width: w * Double(s), height: h * Double(a4H / H))
                                let ann = PDFAnnotation(bounds: rect, forType: .link, withProperties: nil)
                                ann.url = URL(string: l["href"] as! String)
                                ann.border = PDFBorder(); ann.border?.lineWidth = 0
                                page.addAnnotation(ann)
                            }
                        }
                        doc.write(to: pdfURL)
                        print("pdf ok, A4, links:", page.annotations.count)
                        NSApp.terminate(nil)
                    }
                }
            }
        }
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.prohibited)
let renderer = Renderer()
DispatchQueue.main.asyncAfter(deadline: .now() + 40) { print("timeout"); NSApp.terminate(nil) }
app.run()
