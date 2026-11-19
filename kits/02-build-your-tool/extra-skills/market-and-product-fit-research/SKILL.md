---
name: market-and-product-fit-research
description: >
  Run a deep, evidence-first market and product-fit research pass by going out and reading what real
  users actually wrote — Reddit threads and comments, X/Twitter posts, forums, reviews, and the open
  web — then synthesizing demand signals, jobs-to-be-done, ICP, competitor gaps, and positioning
  hypotheses with a citation behind every single claim. NOTHING IS INVENTED: every finding carries a
  source URL, a date, and an engagement count, and anything that could not be verified is reported as
  a named gap instead of a guess. TRIGGER on "deep research this market", "market and product fit
  research", "validate this product idea with real data", "what are people actually saying about X",
  "find the real pain points", "voice of customer research", "mine Reddit for X", "research this
  niche properly", "i-research mo nang malalim", "ano ba talaga reklamo ng users", "hanapin mo kung
  saan nagrereklamo ang users", "saan nag-uusap ang market ko", "patunayan mo may market", or
  /market-and-product-fit-research. Give a product, category, brand, or audience.
metadata:
  tags: market-research, product-market-fit, voice-of-customer, reddit, x-twitter, evidence-based, deep-research
---

# Market & Product Fit Research

Deep primary research on what a market **actually says**, gathered from where those people really
talk. Output is a cited evidence corpus plus a synthesis built only on top of it.

This is the execution counterpart to `market-and-product-discovery` (which is a framework the human
follows). This skill goes out and *collects*, then reasons only from what was collected.

---

## THE ONE RULE: DO NOT INVENT

This skill is worthless the moment it fabricates. The entire design exists to make invention
structurally impossible.

**Every claim must be traceable to a row in the evidence ledger, and every row has a real URL.**

| Banned | Required instead |
|---|---|
| "Many women complain about sleep" | "Sleep is the top theme: 23 of 87 harvested posts (26%), highest-scoring at 3,711 upvotes — `ev_014`, `ev_031`, `ev_055`" |
| "Studies show 70% of…" | A URL to the actual study, or don't say it |
| Making up a subreddit, forum, or community name | Search for it, confirm it loads, record subscriber count |
| Inventing a persona backstory | Compose the ICP only from attributes stated in harvested posts |
| Inventing quotes, or "representative" paraphrases in quote marks | Verbatim ≤25 words + URL, or clearly labeled paraphrase |
| Inventing prices, market size, sales volume | Cite the listing/report, or log it as a GAP |
| Filling a thin section to look complete | Write "INSUFFICIENT EVIDENCE — see Gap Register" |

**Recall is not evidence.** If you already "know" something about this market from training, it does
not go in the report unless you found and cited a source in this run. Prior knowledge is only allowed
to *generate search queries*, never to populate findings.

**A thin, honest report beats a rich, invented one.** The user can act on 12 cited findings. They
cannot act on 40 plausible sentences.

Full protocol, confidence tiers, and the self-audit checklist: `references/evidence-rules.md`.

---

## Where the users actually are — verified access map

Tested in this environment. Do not waste turns re-discovering the blocks.

| Source | Path that works | Reality |
|---|---|---|
| **Reddit** — listings, search, **comments** | **Claude in Chrome only** (`mcp__claude-in-chrome__*`) | The richest source by far. Comments carry upvote-validated verbatim voice-of-customer. |
| Reddit via WebFetch / WebSearch / curl | — | **Permanently blocked.** Reddit bans Anthropic's user agent; `WebSearch` errors outright on `reddit.com`, `WebFetch` refuses, curl 403s. Never try. |
| **X / Twitter** | `WebSearch` with `allowed_domains:["x.com","twitter.com"]` | Post text arrives inside the result title, plus a canonical URL. **No engagement metrics.** Treat as directional. |
| X via WebFetch or Chrome | — | Blocked (HTTP 402 / domain not allowed). |
| **Open web** — news, Substack, blogs, forums, PubMed, ClinicalTrials, industry reports | `WebSearch` + `WebFetch` | Works well. Best source for market size, clinical claims, category trends. |
| Amazon, YouTube, Quora, Trustpilot, nitter | — | Blocked on every tested path. Log as a Gap; do not fake substitutes. |

**Chrome is per-domain approved by the user.** `reddit.com` is already allowed. Any other domain
returns "Navigation to this domain is not allowed" — that is the user's Claude-in-Chrome permission
list, not something you can work around. If a domain would materially improve the research, name it
and ask the user to approve it. Do not silently substitute a weaker source.

Search recipes and the community-discovery procedure: `references/source-map.md`.

---

## Workflow

### Phase 0 — Scope (ask once, then go)

Ask only what you cannot infer. Defaults in bold.

| Input | Default | Notes |
|---|---|---|
| Subject | — | Product, category, brand, or audience. Required. |
| Geography | **US/global English** | **Ask if the target is non-US.** Reddit skews US — a PH/SEA brief needs this flagged up front (see Geography honesty below). |
| Depth | **Standard** (~40 queries, ~8 threads mined) | Quick ≈15 queries · Deep ≈80 queries, ~20 threads |
| Angle | **Full** | Full · pain-only · competitor-only · language-only |
| Workspace | `./market-research/<slug>/` | Reuse across runs to enable diffing. |

Then state the plan in two lines and start. Do not interview the user for ten minutes.

### Phase 1 — Find where they are (never assume)

**Do not guess community names.** Guessing a subreddit is invention.

1. `WebSearch` for the landscape: `"best subreddit for <topic>"`, `"<topic> forum community"`.
2. In Chrome, open `https://www.reddit.com/search/?q=<topic>&type=community` and harvest real
   subreddit names + subscriber counts with the extractor.
3. Record each confirmed community in `communities.csv`: name, URL, subscribers, activity, why relevant.
4. If a community you expected does not exist, **write that down** — an absent community is a real
   market signal.

### Phase 2 — Build the query matrix

Breadth beats depth: Reddit search returns ~7 results per query and does not scroll further, so
coverage comes from **many angles**, not deeper pagination.

Cross these axes into 15–80 queries:

- **Symptom / problem** — the raw complaint words
- **Job-to-be-done** — "how do I…", "what works for…", "anyone tried…"
- **Solution / category** — product types, ingredients, brand names
- **Competitor** — named brands
- **Trigger moment** — "just got diagnosed", "started noticing", "my doctor said"
- **Failure** — "didn't work", "waste of money", "gave up on", "side effects"
- **Switching** — "switched from", "better than", "alternative to"

Run each across relevant subreddits and time windows (`t=year`, `t=all`). Log every query in
`queries.csv` **including the ones that returned nothing** — zero-result queries are findings.

### Phase 3 — Harvest

Use the tested extractors in `references/extractors.md` (Reddit listings, Reddit search, and
comments). Append every item to `evidence.csv` with: `evidence_id`, source, URL, date, title/text,
score, comment count, community, query that found it.

**Then mine comments.** This is where the value is — a single thread yields 100+ upvote-ranked
verbatim reactions. Pick the top 8–20 threads by relevance × engagement, open each permalink, scroll,
and extract top-level comments with scores.

Pacing: 2–4s between navigations, scroll in increments. This runs in the user's own browser — behave
like a person reading, not a scraper.

**Privacy:** do not collect usernames (they arrive auto-redacted; keep it that way). Personal stories
get paraphrased or quoted ≤25 words with a link — never republished wholesale.

### Phase 4 — Code and count

Tag each evidence row with themes. Then build the theme table — **frequency is the finding**:

| Theme | n | % of corpus | Median score | Top evidence |
|---|---|---|---|---|

Rank by frequency × engagement. A theme mentioned twice is a hypothesis; a theme in 30% of a
200-row corpus with high upvotes is a market signal. Say which one you have.

### Phase 5 — Extract their language

Pull the exact words, verbatim (≤25 words each, each with a URL). These become headlines, hooks, and
ad copy later — that only works if they are real.

Group into: **problem words** · **desire words** · **dismissal words** (how they've been brushed off)
· **solution words** · **objection words**.

### Phase 6 — Solution landscape

From the corpus only: what are they already using, what do they praise, what do they abandon and
why, what do they wish existed, what do they refuse to pay for. Every cell cites evidence IDs.

### Phase 7 — Synthesize

Build only on Phases 3–6. Each section states its evidence base and confidence tier:

1. **Demand signals** — is there a real, felt, recurring problem? With counts.
2. **Jobs to be done** — functional, emotional, social. Each JTBD cites ≥3 evidence rows.
3. **ICP** — assembled from stated attributes only. Unknown fields stay "not established."
4. **The gap** — what the market complains about that nothing serves. The core output.
5. **Positioning hypotheses** — 2–4, each labeled **HYPOTHESIS** and tied to its evidence.
6. **Risks / disconfirming evidence** — actively report what contradicts the thesis (mandatory).

### Phase 8 — Gap Register (mandatory)

Never skip. List every question you could not answer and why: blocked source, no data found,
geography mismatch, needs primary interviews. **This section makes the rest trustworthy.**

---

## Geography honesty

Reddit and X are English/US-heavy. For a Philippines, SEA, or other non-US brief, you must state
plainly:

> "This corpus is N% US/UK/AU voices. The problem language likely transfers; **pricing, channel,
> healthcare access, and purchase behavior do not.** Local validation is required for those."

Do not quietly present US findings as local truth. If PH-specific evidence is thin, search for local
communities explicitly — and if the evidence still isn't there, that goes in the Gap Register.

---

## Deliverables

Written to `./market-research/<slug>/`:

| File | Contents |
|---|---|
| `evidence.csv` | Every harvested item — the spine. Nothing in the report may lack a row here. |
| `communities.csv` | Confirmed communities + sizes |
| `queries.csv` | Every query run, incl. zero-result ones |
| `comments.csv` | Mined comments w/ scores + thread URL |
| `RESEARCH-REPORT.md` | The synthesis (template in `references/output-templates.md`) |
| `LANGUAGE-BANK.md` | Verbatim customer language, grouped, each cited |
| `GAP-REGISTER.md` | What could not be verified and why |

Before delivering, run the self-audit in `references/evidence-rules.md`: every claim traced, every
quote linked, every number counted, confidence tiers assigned, gaps declared.

---

## Reporting to the user

Lead with the strongest **cited** finding, not a summary of your process. Give counts, not adjectives.
State the confidence tier. Name what you couldn't verify in the same breath as what you could.

> "Sleep disruption dominates: 23 of 87 posts (26%), the highest-engagement thread at 3.7k upvotes.
> Tier A. But zero PH-specific evidence surfaced across 12 local queries — pricing and channel
> assumptions remain unvalidated."
