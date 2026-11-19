# Output Templates

Fill only from harvested evidence. An empty section is an honest section — write
`INSUFFICIENT EVIDENCE — see Gap Register` and move on.

---

## `evidence.csv`

The spine. Nothing may appear in the report without a row here.

```csv
evidence_id,source,community,url,date,type,title_or_text,score,comments,query,themes
ev_001,reddit,r/Menopause,https://...,2026-03-12,post,"The brain fog is the scariest part...",1191,383,"brain fog","cognition;work-impact"
ev_002,reddit_comment,r/Menopause,https://...,2026-03-12,comment,"I forget my words all the time...",173,,"brain fog","cognition;embarrassment"
ev_003,x,,https://x.com/...,2026-03-15,post,"...",,,"perimenopause brain fog","cognition"
ev_004,web,,https://...,2025-11-01,article,"...",,,"perimenopause workplace cost","work-impact"
```

`type`: `post` · `comment` · `article` · `study` · `listing`
`score`/`comments`: blank when the platform gives none (always blank for X) — **never estimate.**

## `communities.csv`
```csv
name,url,subscribers,last_activity,relevance_note
```

## `queries.csv`
```csv
query,platform,scope,sort,timeframe,results_returned,date_run
"brain fog",reddit,r/Menopause,top,year,7,2026-07-28
"perimenopause Philippines",reddit,site-wide,top,all,0,2026-07-28
```
Zero-result rows are findings. Keep them.

## `comments.csv`
```csv
evidence_id,thread_url,thread_title,score,depth,text,themes
```

---

## `RESEARCH-REPORT.md`

```markdown
# Market & Product Fit Research — <SUBJECT>
**Run date:** YYYY-MM-DD
**Corpus:** N posts · N comments · N communities · N queries · N web sources
**Geography of corpus:** X% US/UK/AU · Y% other · Z% undetermined
**Overall confidence:** A / B / C — one sentence on why

> **Headline finding** — the single most important cited thing, with its numbers.

---

## 1. How this was gathered
Sources used, queries run, what was blocked. One short paragraph. Then, plainly:
**Selection bias:** people post about problems, not about what works fine. A support community
over-represents severity. Counts describe *this corpus*, never the population.

## 2. Where this market talks
| Community | Size | Activity | Why it matters |
Plus: communities expected but not found.

## 3. Demand signals
Is there a real, recurring, felt problem?
| Signal | Evidence | n | Tier |
State it plainly: proven / indicated / not established.

## 4. Theme frequency
| Theme | n | % of corpus | Median score | Top evidence |
Ranked by frequency × engagement. Denominator on every row.

## 5. Jobs to be done
For each (≥3 evidence rows or it doesn't ship):
**JTBD:** When ___, I want to ___, so I can ___.
Functional / Emotional / Social · Evidence: `ev_…` · Tier: _

## 6. ICP — assembled, not imagined
Only attributes actually stated in harvested posts. Unknown fields stay **"not established"** —
do not fill them in to make the profile feel complete.
| Attribute | What evidence shows | Evidence | Tier |

## 7. Solution landscape
| Currently used | Praised for | Abandoned because | Evidence |
Plus: what they say they wish existed, and what they refuse to pay for.

## 8. The gap
The core output: what this market complains about that nothing currently serves.
Evidence · Tier · Size of the signal.

## 9. Positioning hypotheses
**HYPOTHESIS 1:** …
- Rests on: `ev_…`
- Would be confirmed by: …
- Would be falsified by: …

## 10. Disconfirming evidence *(mandatory)*
What contradicts the thesis. Queries run specifically to find it. If none was found, say how hard
you looked — "no disconfirming evidence" without a search is a red flag, not a green light.

## 11. Recommended next steps
Separate what evidence supports from what still needs primary research.
```

---

## `LANGUAGE-BANK.md`

Their exact words. Each ≤25 words, each linked. This is the raw material for future copy — it only
works if it is real.

```markdown
# Language Bank — <SUBJECT>
Verbatim only. Never edited, never composited, never invented.

## Problem words
> "…" — r/X, N upvotes, [link]

## Desire words
## Dismissal words (how they've been brushed off)
## Solution words
## Objection / skepticism words

## Frequency notes
Recurring exact phrases and how often they appeared: `"…"` — n times.
```

---

## `GAP-REGISTER.md`

The section that makes everything else credible.

```markdown
# Gap Register — <SUBJECT>

## Blocked sources
| Source | What it would have answered | Block | Manual workaround |

## Empty searches
| Query | Scope | Why the absence is itself informative |

## Geography limits
Corpus origin vs. target market. **What does not transfer:** pricing, channel, regulatory,
healthcare access, purchase behavior, brand landscape.

## Unanswerable from secondary research
Questions needing interviews, surveys, or a live test.

## Confidence caveats
Findings at Tier C that are load-bearing for the recommendation — flag them explicitly.
```
