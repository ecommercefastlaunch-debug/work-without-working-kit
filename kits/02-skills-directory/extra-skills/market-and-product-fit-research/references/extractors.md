# Extractors — tested harvest code

Every snippet below was run and verified in this environment. Use them as-is.

**All Reddit work goes through Claude in Chrome.** Setup, once per session:

```
mcp__claude-in-chrome__tabs_context_mcp {createIfEmpty: true}   → note the tabId
mcp__claude-in-chrome__navigate       {url, tabId}
mcp__claude-in-chrome__javascript_tool{action:"javascript_exec", tabId, text: <snippet>}
```

Reddit may serve a JS challenge on the first hit. It clears itself — navigate, wait ~2s, extract. If
`document.body.innerText` contains `"blocked by network security"`, wait and re-navigate once; if it
persists, log the query as blocked and move on. Never hammer it.

---

## A. Community discovery

Confirms communities actually exist. **Never name a subreddit you haven't confirmed here.**

Navigate: `https://www.reddit.com/search/?q=<TOPIC>&type=community`

```js
await new Promise(r => setTimeout(r, 2500));
const out = [...document.querySelectorAll('a[href^="/r/"]')]
  .map(a => {
    const row = a.closest('[data-testid], li, div');
    const txt = row?.innerText?.replace(/\s+/g, ' ').trim() || '';
    const m = txt.match(/([\d.,]+[KMkm]?)\s*members?/i);
    return { sub: (a.getAttribute('href').match(/^\/r\/([^/]+)/) || [])[1],
             members: m ? m[1] : null, blurb: txt.slice(0, 160) };
  })
  .filter(x => x.sub);
const seen = new Set();
out.filter(x => !seen.has(x.sub) && seen.add(x.sub)).slice(0, 25);
```

---

## B. Subreddit listing harvest

Navigate: `https://www.reddit.com/r/<SUB>/top/?t=year` (also `/new/`, `t=month`, `t=all`)

Listings lazy-load, so scroll. Verified: yields real scores, comment counts, flairs, timestamps.

```js
const sel = 'shreddit-post';
let last = 0, stable = 0;
for (let i = 0; i < 15 && stable < 3; i++) {
  window.scrollTo(0, document.body.scrollHeight);
  await new Promise(r => setTimeout(r, 1400 + Math.random() * 700));
  const n = document.querySelectorAll(sel).length;
  if (n === last) stable++; else { stable = 0; last = n; }
}
[...document.querySelectorAll(sel)].map(p => ({
  title:    p.getAttribute('post-title'),
  score:   +p.getAttribute('score'),
  comments:+p.getAttribute('comment-count'),
  sub:      p.getAttribute('subreddit-prefixed-name'),
  created:  p.getAttribute('created-timestamp'),
  flair:    p.querySelector('shreddit-post-flair')?.textContent?.trim() || null,
  url: 'https://www.reddit.com' + p.getAttribute('permalink'),
}));
```

Flair is a free classifier — `Rant/Rage`, `Sleep/Insomnia`, `Hormone Therapy` etc. Keep it; it
speeds up Phase 4 coding considerably.

---

## C. Reddit search harvest — the workhorse

Navigate:
`https://www.reddit.com/r/<SUB>/search/?q=<QUERY>&restrict_sr=1&sort=top&t=year`

Site-wide (drop `restrict_sr`): `https://www.reddit.com/search/?q=<QUERY>&sort=top&t=year`

> **Hard limit: ~7 results per query.** Search uses a click-to-load partial, and scrolling does not
> extend it. This is why the method is *many queries*, not deep pagination. Do not burn turns trying
> to paginate — run another angle instead.

Search results use a different DOM than listings:

```js
await new Promise(r => setTimeout(r, 2500));
[...document.querySelectorAll('[data-testid="search-post-unit"]')].map(u => {
  const a    = u.querySelector('a[href*="/comments/"]');
  const href = a?.getAttribute('href') || '';
  const nums = [...u.querySelectorAll('faceplate-number')].map(n => +n.getAttribute('number'));
  return {
    title: a?.textContent?.trim(),
    score: nums[0] ?? null,          // first faceplate-number = upvotes
    comments: nums[1] ?? null,       // second = comment count
    sub: (href.match(/\/r\/([^/]+)/) || [])[1],   // parse from URL — the DOM label is unreliable
    ts: u.querySelector('faceplate-timeago')?.getAttribute('ts'),
    url: a?.href,
  };
});
```

Sort variants: `sort=top` (proven demand) · `sort=new` (emerging) · `sort=comments` (controversy,
often the richest threads).

---

## D. Comment mining — the highest-value extractor

This is where voice-of-customer lives. Verified: **100 comments, 37 top-level, with scores**, from
one thread. Navigate to a post permalink, then:

```js
for (let i = 0; i < 6; i++) {
  window.scrollTo(0, document.body.scrollHeight);
  await new Promise(r => setTimeout(r, 1500 + Math.random() * 500));
}
[...document.querySelectorAll('shreddit-comment')]
  .map(c => ({
    score: +c.getAttribute('score'),
    depth:  c.getAttribute('depth'),
    text:   c.querySelector('[slot="comment"]')?.innerText?.trim().replace(/\s+/g, ' '),
  }))
  .filter(c => c.text && c.text.length > 40)
  .sort((a, b) => b.score - a.score);
```

- **Top-level only** (`depth === "0"`) for theme counting — replies are conversation, not independent signal.
- High-score comments are peer-validated: many people recognized themselves in that sentence.
- Store full text in `comments.csv` for your own analysis, but **quote ≤25 words** in deliverables.
- Click "View more comments" if present and depth matters.

---

## E. X / Twitter

No DOM access — `x.com` is blocked in both browsers and returns HTTP 402 to WebFetch. The only path:

```
WebSearch { query: "<topic> <pain phrase>", allowed_domains: ["x.com", "twitter.com"] }
```

The post text comes back **inside the result title**, with a canonical URL. Verified working.

Limits, state them in the report: no upvote/like/repost counts, no thread context, no reply mining,
and results skew toward media accounts and viral posts rather than ordinary users. Treat X as
**directional colour**, never as a frequency base. Do not compute percentages from X.

---

## F. Open web

`WebSearch` for discovery → `WebFetch` for the actual page content.

Works well for: market size and industry reports, clinical/scientific claims (PubMed, ClinicalTrials),
category trend pieces, niche forums and blogs, Substack (surprisingly rich for lived-experience
writing), competitor sites and their own claims.

Use `allowed_domains` to force a source, `blocked_domains` to strip SEO spam. When a page is
paywalled or 403s, log it in the Gap Register — do not substitute a summary of what you assume it says.

---

## G. Blocked — do not retry

Verified blocked. Each cost a turn to discover; don't spend them again.

| Target | Result |
|---|---|
| `reddit.com` via WebSearch | Hard API error: domain not accessible to the user agent |
| `reddit.com` via WebFetch | "unable to fetch" |
| `reddit.com` via curl / Bash | HTTP 403 |
| `reddit.com` via the **in-app** browser (`mcp__Claude_Browser__*`) | Blocked by policy — use **Claude in Chrome** instead |
| `reddit.com/*.json` (even inside Chrome) | Returns the HTML anti-bot page, not JSON |
| `x.com` via WebFetch | HTTP 402 |
| `x.com`, `nitter.net`, `amazon.com`, `youtube.com` via Chrome | "Navigation to this domain is not allowed" |
| `quora.com`, `trustpilot.com` via WebFetch | HTTP 403 |

**Chrome uses a per-domain allowlist the user controls.** `reddit.com` is approved. If another
domain would materially help, name it and ask the user to approve it in their Claude in Chrome
settings. Never silently swap in a weaker source and present it as equivalent.

---

## Pacing and conduct

This runs in the **user's own logged-in browser**. Their account bears any consequence.

- 2–4s between navigations; jittered scroll waits (already in the snippets).
- Read-only. Never post, vote, comment, DM, or click anything that writes.
- Never read `document.cookie` or touch auth tokens.
- Never collect usernames.
- If a challenge page appears twice for the same URL, stop and log it. Do not grind.
