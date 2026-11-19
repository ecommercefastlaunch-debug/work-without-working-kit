# Evidence Rules — the no-invention protocol

The whole skill rests on this file. If a finding cannot survive these rules, it does not ship.

---

## 1. The traceability requirement

Every sentence in every deliverable falls into exactly one of three buckets:

| Bucket | Marking | Requirement |
|---|---|---|
| **Finding** | plain text + `ev_xxx` refs | Must trace to ≥1 row in `evidence.csv` with a live URL |
| **Hypothesis** | prefixed **HYPOTHESIS:** | Your reasoning on top of findings. Must name the findings it rests on. |
| **Gap** | in `GAP-REGISTER.md` | What you could not establish, and why |

There is no fourth bucket. "General knowledge," "commonly understood," and "it's well known that"
are not buckets — they are invention wearing a lab coat.

**Test for any sentence:** *Can I click something that shows this is true?* If no → it is a
Hypothesis or a Gap. Reclassify it; don't delete the thought.

---

## 2. Prior knowledge is for queries only

You know things about most markets from training. That knowledge has exactly one legitimate use:
**generating search queries.**

- ✅ "I recall ashwagandha is common here" → run the query `ashwagandha` → report only what returns.
- ❌ "Ashwagandha is popular in this category" as a finding without a harvested source.

Training data is stale, unciteable, and unfalsifiable. It cannot be evidence.

---

## 3. Confidence tiers

Assign one to every finding. Put it in the text, not a footnote.

| Tier | Bar | How to phrase it |
|---|---|---|
| **A — Strong** | ≥5 independent sources, ≥2 communities, meaningful engagement, consistent | "clearly established" |
| **B — Moderate** | 2–4 sources, or many sources but one community/thread | "indicated by" |
| **C — Weak** | 1 source, or low engagement, or all from one thread | "a single account suggests" |
| **UNVERIFIED** | Cannot substantiate | Move to Gap Register |

"Independent" means different threads and ideally different communities. Forty comments in one
thread are **one thread**, not forty sources — it is a Tier B at best, and say so.

---

## 4. Counting rules

Frequency is the product of this skill. Get it honest.

- Always report **n and denominator**: "23 of 87 posts (26%)" — never a bare "23 posts" or "many."
- State the corpus: "across 87 posts and 412 comments from 4 communities, harvested 2026-07-28."
- **Engagement is a weight, not a vote count.** A 3.7k-upvote post means 3.7k people endorsed a
  *statement*; it does not mean 3.7k people have that problem. Phrase accordingly.
- Selection bias is real and must be stated once, plainly: people post about problems, not about
  things that work fine. A support community over-represents severity. Say it; don't pretend it away.
- Never extrapolate a corpus percentage to the population. "26% of harvested posts" ≠ "26% of women."

---

## 5. Quoting

Reddit and most sites prohibit wholesale reproduction, and long quotes are also just bad research
hygiene.

- **Verbatim ≤25 words**, in quote marks, with the URL immediately adjacent.
- Longer material → paraphrase, labeled as paraphrase, still linked.
- Never merge several people's words into one "representative quote." That is fabrication.
- Never clean up grammar inside quote marks. Their exact words are the asset. `[sic]` not needed.
- **No usernames.** They arrive auto-redacted — keep it that way. Cite the thread, not the person.
- Never quote anything identifying a private individual beyond the pseudonymous post itself.

---

## 6. Handling absence

Absence of evidence is a finding — and one of the most valuable ones. Report it, never paper over it.

| Situation | Correct report |
|---|---|
| Query returned nothing | "12 queries on PH-specific terms returned zero relevant results." |
| Source is blocked | "Amazon reviews unavailable — blocked in this environment. Recommend manual pull." |
| Community doesn't exist | "No dedicated community found for X, despite 6 discovery queries." |
| Contradictory evidence | Report **both sides with counts.** Never drop the inconvenient half. |
| Thin corpus overall | Say so in the headline, before the findings. |

**Disconfirming evidence is mandatory.** Actively search for it: `"<thesis> didn't work"`,
`"waste of money"`, `"overrated"`. A report with no contradicting evidence has not looked for any,
and should be trusted less, not more.

---

## 7. Self-audit before delivery

Do not deliver until every line passes.

**Traceability**
- [ ] Every finding cites ≥1 `ev_` ID
- [ ] Every `ev_` ID exists in `evidence.csv` with a real, well-formed URL
- [ ] Spot-check 3 random URLs — they load and say what the row claims
- [ ] No claim rests on recall rather than a harvested source

**Numbers**
- [ ] Every count has a denominator
- [ ] Corpus size, community count, and harvest date stated once, up front
- [ ] No population-level extrapolation from corpus percentages
- [ ] Selection bias stated

**Quotes**
- [ ] All ≤25 words, all linked, all verbatim
- [ ] No composite or "representative" quotes
- [ ] No usernames

**Honesty**
- [ ] Confidence tier on every finding
- [ ] Hypotheses labeled **HYPOTHESIS**
- [ ] Disconfirming evidence actively sought and reported
- [ ] Gap Register complete — blocked sources, empty queries, geography limits
- [ ] Geography caveat present if target market ≠ corpus origin

**The final question:** *If the user acted on this report and it went wrong, would they find I
overstated something?* If yes, go fix it before shipping.
