---
name: breakthrough-ads
description: Write 10 ready-to-use ad scripts per request, each from a different angle, using Eugene Schwartz's Breakthrough Advertising principles (mass desire, the 5 levels of awareness, the 5 stages of market sophistication, and the 7 copy techniques — intensification, identification, gradualization, redefinition, mechanization, concentration, camouflage). The user plugs in their offer (ideally their Offer Profile .md file from the offer-builder skill, or just a description of what they sell) and gets 10 ads covering direct response, objection handling, education, problem-agitation, stories, proof, and more. Use this skill whenever someone wants ads, ad scripts, ad copy, video ad scripts, Reels/TikTok/Facebook/Instagram ads, promo posts, sales captions, hooks, headlines, or "mga ads para sa offer ko" — even if they don't mention Schwartz or say "copywriting", and especially when they upload or paste an offer profile and ask for marketing content.
---

# Breakthrough Ads: 10 Ad Scripts Per Request

Your job: take a business's offer and produce **10 distinct, ready-to-run ad scripts** in one response, each attacking the market from a different angle, all grounded in Eugene Schwartz's *Breakthrough Advertising*.

Schwartz's central idea: **copy cannot create desire. It can only take a hope, dream, fear, or desire that already exists in millions of people and channel it onto one product.** Every ad here therefore starts from the market's existing desire, not from the product's features. The 10 angles exist because one market contains people at different levels of awareness, with different doubts, who need to be reached in different ways.

Read `references/schwartz-principles.md` for the full framework before writing (mass desire, awareness, sophistication, the 7 techniques, headline principles). Read `references/ad-angles.md` for the 10 angle recipes, hook formulas, and an example.

## Language and voice

Write in the language and voice the business's *customers* use. If the profile says "warm Taglish," write Taglish; if it says Cebuano, use Cebuano with an English gloss if helpful. Talk to the brief (strategy notes) in the user's own language. Ads should sound like a real person talking, not like a corporate brochure.

## Step 1 — Load the offer

Look for, in order:
1. An **Offer Profile** file (e.g., `something-offer-profile.md`) the user uploaded, pasted, or that exists in the Project knowledge. This comes from the `offer-builder` skill and contains the Business Profile Card, target market, emotions map, competitors, positioning, and offer statements. Use it fully — customer quotes from the Emotions Map are gold for hooks.
2. Otherwise, whatever the user told you about the business.

If key facts are missing (what it is, who it's for, price, where they sell, the main result), ask for them in one short batch — or, if the user wants speed, make labeled assumptions. If there's no profile at all, mention in one line that running the `offer-builder` skill first will make the ads sharper.

Also note any **ad format** the user asked for. Default: short-form **video ad scripts** (Reels / TikTok / Facebook / YouTube Shorts, 30–60 seconds) plus a written caption. If they ask for static image ads, carousels, radio, long-form, or sales captions only, adapt the format but keep the 10-angle structure.

## Step 2 — Write the Ad Strategy Brief (short)

Before the ads, answer Schwartz's three questions that come before any headline (desire, awareness, sophistication), plus two working notes (mechanism, belief obstacles). Keep it to a compact table, because the owner reads it to understand *why* the ads say what they say. Put any assumptions in one short bullet list just above the brief, not scattered through the ads:

1. **Mass desire**: the single most powerful desire this product can channel (rate its urgency, staying power, and scope). Name the dominant desire and 1–2 supporting ones.
2. **Awareness spread**: how much of the market is Unaware / Problem-aware / Solution-aware / Product-aware / Most-aware, and what that means for hooks.
3. **Market sophistication stage (1–5)**: how many similar claims the market has already heard, and therefore whether to lead with the **claim**, an **enlarged claim**, a **mechanism**, an **enlarged mechanism**, or **identification**.
4. **The mechanism**: the "how it works / why it's different" in one sentence (name it if useful).
5. **Belief obstacles**: the top 3 doubts the ads must dissolve.

If the user named specific platforms (e.g., Facebook + TikTok), add a short **platform setup** note after the brief: aspect ratios, captions/subtitles, CTA button type, and any platform rule that affects the hooks. Keep the per-ad format the same for every platform.

## Step 3 — Write the 10 ads

Use the 10 angles in `references/ad-angles.md`, one ad each, in this order (they progress from cold to hot audiences):

| # | Angle | Awareness level targeted | Main Schwartz technique |
|---|---|---|---|
| 1 | Hidden Truth / Educational Hook | Unaware | Camouflage + Gradualization |
| 2 | Story Belief Chain | Unaware → Problem-aware | Gradualization + Identification |
| 3 | Problem Agitation | Problem-aware | Intensification of the pain |
| 4 | Identification ("This is for you if…") | Problem-aware | Identification (character + achievement) |
| 5 | Why Other Solutions Fail | Solution-aware | Concentration |
| 6 | Mechanism / How It Works (Education) | Solution-aware | Mechanization |
| 7 | Objection Crusher | Product-aware | Redefinition |
| 8 | Proof & Transformation | Product-aware | Intensification + Verification |
| 9 | Dream Outcome Vision | Product-aware / any | Intensification of the desire |
| 10 | Direct Response Offer | Most-aware | Direct claim: offer + risk reversal + urgency |

If the brief shows the market is at sophistication stage 3–5, lean harder on mechanism and identification across *all* ads (not just #4 and #6), because plain claims won't be believed anymore.

### Format for each ad

```markdown
### Ad [#]: [Angle name] — "[short internal title]"
**Targets**: [awareness level] · **Technique**: [Schwartz technique] · **Best for**: [cold / warm / retargeting]

**HOOK (0–3s)**: [the first spoken line — the headline of the ad]
**On-screen text**: [what appears on screen during the hook]

**SCRIPT**:
[Spoken script, broken into short lines, with brief visual/B-roll cues in brackets, e.g. [close-up of product], [show before photo]]

**CTA**: [one clear action + reason to act now]

**Caption / primary text**: [2–5 lines for the post]
**Headline (for ad platforms)**: [≤ 40 characters]
```

Keep scripts tight: about 80–150 spoken words for a 30–60 second video. Each ad should be able to run on its own.

### What makes the 10 ads good

- **Each ad enters the conversation already in the prospect's head.** The hook meets them at their awareness level: an Unaware prospect hears a surprising fact or story, not the product name; a Most-aware prospect hears the offer and price immediately. The headline's job is to stop the right person and make them want the next line, not to sell everything.
- **Use the customer's own words.** Pull phrases from the Emotions Map (pains, frustrations, fears, dreams). Specific beats clever.
- **Every ad delivers the offer formula somewhere**: the **result**, the **frustration**, the **risk killed**, and the **speed & ease** — weighted differently by angle, and all of them strong in the Direct Response ad.
- **No two ads share a hook structure.** Vary openings: question, bold statement, statistic, story, "POV", confession, myth-bust, list, direct callout, demonstration.
- **One CTA per ad**, consistent with how the business actually sells (DM, link, call, visit store, book).
- **Honest claims only.** Schwartz's techniques make true claims believable — never use them to make false claims believable. No fake testimonials, invented numbers, fake scarcity, or outcome guarantees in regulated industries (follow any compliance notes in the profile). If an ad needs proof the business doesn't have yet, write a placeholder like `[insert real customer result]` and flag it.
- **When proof is missing, demonstrate.** If the business has no testimonials yet, prefer a live demonstration (show the product being tested, show the price list, show the process) over placeholder testimonials; Schwartz treats demonstration as one of the strongest forms of proof.
- **Respect ad-platform rules.** Meta and TikTok don't allow hooks that assert or imply the viewer's personal attributes (health conditions, weight, finances, etc.). So write "POV: …", first-person, or general phrasing instead of "Do you have acne?" Health, cosmetic, weight-loss, and financial ads often need 18+ targeting and limit before/after images. Flag these where they apply.
- **Camouflage = native style, not deception.** Ad #1 can look like helpful content or a tip, but it must still be honest and run as a labeled ad where platforms require it.

## Step 4 — Close with a short test plan

After the 10 ads, add:
- **Which 3 to test first** and why (usually one cold, one warm, one hot).
- **What to measure** (hook rate / 3-second views for hooks; clicks, DMs, or bookings for conversion).
- **Proof or assets to prepare** (testimonials, photos, demo clips) that any ad flagged as needed.

## Asking for more

If the user asks for "10 more," "another batch," or ads for a specific angle/platform/season/promo:
- Don't repeat earlier hooks or stories. Choose new desires to channel (secondary desires, the secondary audience), new hook structures, new mechanisms of explanation, new objections, or seasonal/promo wrappers.
- Keep the same per-ad format and still cover a spread of awareness levels unless they asked for one specific angle.

## Output order (summary)

1. Ad Strategy Brief
2. Ads 1–10
3. Test Plan

If you can create files, also offer to save the batch as `[business-name]-ads-batch-[n].md` so they can keep a library of ads.
