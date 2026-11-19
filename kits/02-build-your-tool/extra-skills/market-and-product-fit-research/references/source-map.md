# Source Map — finding where the users actually are

Do not assume where a market talks. Find it, confirm it, record its size.

---

## Step 1: Discover communities (never guess)

Naming a subreddit or forum from memory is invention — the name may not exist, may be dead, or may
be about something else entirely. Always confirm.

1. `WebSearch`: `"best subreddit for <topic>"`, `"<topic> online community"`, `"where do <audience> talk about <problem>"`
2. Chrome → `https://www.reddit.com/search/?q=<topic>&type=community` → extractor A
3. Open the top 3–5 and confirm: real subscriber count, posts within the last week, on-topic.
4. Record in `communities.csv`: `name, url, subscribers, last_activity, relevance_note`

Also look for **adjacent** communities — where the audience gathers for a *different* reason
(profession, life stage, region). Off-topic communities often carry more candid talk than the
dedicated support sub, which can be dominated by regulars and rules.

---

## Step 2: The query matrix

Reddit search caps around 7 results per query, so coverage comes from angles, not depth. Cross these
axes; aim for 15 (quick) / 40 (standard) / 80 (deep) queries.

| Axis | Pattern | Yields |
|---|---|---|
| Symptom / problem | the raw complaint word | Core pain, their vocabulary |
| Job-to-be-done | `how do I…` `what works for…` `anyone tried…` | Intent and desired outcome |
| Trigger moment | `just started` `just got diagnosed` `my doctor said` | Entry point into the category |
| Solution / category | product types, ingredients, formats | Consideration set |
| Competitor | brand names | Real perception vs. their marketing |
| Failure | `didn't work` `waste of money` `gave up` `side effects` | Gaps, churn reasons |
| Switching | `switched from` `better than` `alternative to` | Competitive dynamics |
| Price | `worth it` `too expensive` `cheaper than` | Willingness to pay |
| Dismissal | `doctor didn't believe me` `told me it was normal` | Emotional territory, positioning gold |
| Recommendation | `recommend` `holy grail` `changed my life` | What actually earns advocacy |

**Log every query in `queries.csv`, including zero-result ones.** A category term nobody uses is a
finding about how the market actually thinks.

### Sort strategy
- `sort=top&t=year` — proven, durable concerns
- `sort=new` — emerging issues, current sentiment
- `sort=comments` — controversy and debate; usually the richest threads to mine
- `t=all` — the canonical, oft-referenced threads

---

## Step 3: Source priority

Spend effort where the return is. Ranked by evidence value per turn.

1. **Reddit comments on high-engagement threads** — verbatim, upvote-validated, emotionally honest. Highest value by a wide margin.
2. **Reddit search across many queries** — the frequency base for all counting.
3. **Reddit listings by flair** — free pre-classification of themes.
4. **Open web / WebFetch** — market size, clinical claims, category trends, competitor positioning.
5. **X via WebSearch** — directional colour only. No metrics, no percentages.

---

## Step 4: Cross-check before believing

Before promoting anything to Tier A, ask:

- Does it appear in **more than one community**?
- Does it appear across **more than one time window**?
- Is it in **posts and comments**, or only in one thread's echo?
- Did I search for the **opposite** and fail to find it? (Run the disconfirming query — mandatory.)
- Is one loud thread inflating it?

---

## Non-US and non-English markets

Reddit and X are English/US-heavy. For a PH, SEA, or other local brief:

- Search in the local language and in code-switched forms (e.g. Taglish) — real users mix languages.
- Look for country/region communities and diaspora communities, confirming each one exists.
- Try local platforms explicitly. Many are blocked here — **log the block, don't fake around it.**
- Compute the geography split of your corpus and **state it in the headline of the report.**

What transfers across geography: problem language, emotional territory, symptom vocabulary.
What does **not**: pricing, channel, regulatory constraints, healthcare access, purchase behavior,
brand landscape. Never present US findings as local truth on those.

---

## When a source is blocked

Blocked sources are common here (see `extractors.md` §G). The correct response is always the same:

1. Log it in the Gap Register with the specific target and what it would have answered.
2. Recommend how the user can get it manually (their own browsing, an export, a purchased report).
3. **Never substitute recall.** "Amazon reviews typically say…" is invention.

For competitor advertising specifically, the `meta-ads-scraper` skill is a working, tested path —
hand off to it rather than guessing what competitors run.
