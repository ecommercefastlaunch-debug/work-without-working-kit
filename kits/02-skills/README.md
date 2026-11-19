# Kit 02: Sales and Marketing Skills

**61 Claude skills for sales and marketing, installed in one go**, including image making with
the owner's own ChatGPT account (through Codex). Do the Work Without Working Setup Kit
(Kit 01) first; this kit needs its Git and Node.js.

## The one prompt (owners paste this)

```
Add my sales and marketing skills from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/02-skills/SETUP.md and install them for me.
```

## What happens

1. Claude installs all 61 skills into `~/.claude/skills` (they work in every project).
2. Claude connects Codex to the owner's ChatGPT account for images: the owner signs in
   themselves in the browser. Codex comes with the ChatGPT desktop app on a Mac, or is
   installed with npm. Codex makes still images only; it can't make videos yet.
3. A checklist by category, and 3 skills to try first.

## Other way: Google Drive

If the prompt can't run (no Git, blocked internet), students scan the second QR on workbook
page 5. It opens a Google Drive folder with `sales-and-marketing-skills.zip` (all 61 skills
plus a README). They download it to their laptop, then paste in Claude: "Install the skills
from sales-and-marketing-skills.zip in my Downloads folder." Drive folder:
https://drive.google.com/drive/folders/1J9hQ2yeu1fPpNu0OMcbTp-0xPjsmdrMM

When the skill list changes, rebuild that zip from a fresh install and replace it in Drive.

## The skills

The list lives in [skills.tsv](skills.tsv). The installer reads it, so add or remove a row
there to change the kit, then run `python3 gen-readme.py` to rebuild this page.

### Offers & positioning (9)

| Skill | What it does | Source |
|---|---|---|
| offer-builder | Market research, competitors and offer statements from what you sell | this kit ([skills/](skills/offer-builder)) |
| offers | Makes your offer stronger: bonuses, guarantees, honest urgency, upsells | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| hundred-million-offers | Hormozi's Grand Slam Offer: value equation, bonus stack, guarantee | [wondelai/skills](https://github.com/wondelai/skills) |
| product-marketing | Who it's for, why you, what to say first | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| obviously-awesome | Positioning: your real competitors, what makes you different, your best customers | [wondelai/skills](https://github.com/wondelai/skills) |
| storybrand-messaging | A clear one-liner and brand message where the customer is the hero | [wondelai/skills](https://github.com/wondelai/skills) |
| pricing | What to charge, packages and tiers, raising prices | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| customer-research | Turns customer messages and reviews into what they really want | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| competitors | Fair comparisons with competitors ("us vs them") | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |

### Sales (8)

| Skill | What it does | Source |
|---|---|---|
| sales-objections | Word-for-word answers to "too expensive", "I'll think about it" and more | this kit ([skills/](skills/sales-objections)) (MIT) |
| sales-followup | Follow-ups after a quote or inquiry, and for customers who went quiet | this kit ([skills/](skills/sales-followup)) (MIT) |
| negotiation | Calm scripts for haggling and discount requests | [wondelai/skills](https://github.com/wondelai/skills) |
| proposal-pricing | Proposals and quotes with three price options | [TheCraigHewitt/skills](https://github.com/TheCraigHewitt/skills) |
| sales-enablement | Sales one-pagers, talk tracks and objection sheets | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| prospecting | Who to target first and how to spot buyers | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| cold-email | Cold outreach messages that get replies | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| 100m-leads | Hormozi's Core Four for getting leads: warm, content, cold, ads | [getagentseal/founder-playbook](https://github.com/getagentseal/founder-playbook) |

### Copy & writing (10)

| Skill | What it does | Source |
|---|---|---|
| copywriting | Offers, landing pages, headlines, product pages | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| copy-editing | Tightens and proofreads your text without rewriting it | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| made-to-stick | Makes your message simple, memorable and believable | [wondelai/skills](https://github.com/wondelai/skills) |
| storytelling | Gives scripts and posts a story that holds attention | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) |
| hook-killers | Fixes weak opening lines | this kit ([skills/](skills/hook-killers)) (MIT) |
| marketing-psychology | Honest persuasion: social proof, anchoring, framing | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| influence-psychology | Cialdini's 7 principles of persuasion for copy and sales | [wondelai/skills](https://github.com/wondelai/skills) |
| stop-slop | Keeps the writing from sounding like AI | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) |
| anti-ai-writing | A final check that strips AI-sounding writing | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) |
| dumbify | Keeps explanations and customer messages simple | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) |

### Ads & images (5)

| Skill | What it does | Source |
|---|---|---|
| breakthrough-ads | 10 ad scripts per request, each from a different angle | this kit ([skills/](skills/breakthrough-ads)) |
| ad-creative | Ad headlines and copy variations | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| ads | Plans paid ads: channel, budget, and why results changed | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| ab-testing | Plans A/B tests and reads whether a result is real | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| image-generation | Makes and edits images with your ChatGPT account (via Codex) | this kit ([skills/](skills/image-generation)) |

### Social & video (11)

| Skill | What it does | Source |
|---|---|---|
| social | Posts, carousels and content calendars | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| social-captions | Captions for Facebook, Instagram, TikTok with A/B versions | [minhnv0807/ai-business-skills](https://github.com/minhnv0807/ai-business-skills) |
| content-strategy | What to post about so content brings customers | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| content-brief | A brief for one post before anyone writes it | [minhnv0807/ai-business-skills](https://github.com/minhnv0807/ai-business-skills) |
| content-repurposing | One piece of content into many posts | this kit ([skills/](skills/content-repurposing)) |
| video-scripts | Short video scripts, beat by beat, with hooks | [minhnv0807/ai-business-skills](https://github.com/minhnv0807/ai-business-skills) |
| viral-hooks | Opening lines that stop the scroll | [vyralcontent/content-skills](https://github.com/vyralcontent/content-skills) |
| viral-captions-and-ctas | Captions and calls to action that get saves and replies | [vyralcontent/content-skills](https://github.com/vyralcontent/content-skills) |
| viral-instagram-reels | Reels that reach new people | [vyralcontent/content-skills](https://github.com/vyralcontent/content-skills) |
| viral-tiktok-content | TikTok scripts and ideas shaped for the For You page | [vyralcontent/content-skills](https://github.com/vyralcontent/content-skills) |
| viral-short-form-ideas | Lots of short video ideas when you're stuck | [vyralcontent/content-skills](https://github.com/vyralcontent/content-skills) |

### Email, chat & leads (5)

| Skill | What it does | Source |
|---|---|---|
| emails | Welcome, follow-up and win-back email sequences | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| sms | Text and WhatsApp promos, abandoned cart, win-back | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| whatsapp-marketing | Chat selling: broadcasts, flows, conversations (works for Messenger and Viber too) | [arnabbagxd/Brand-building-skills](https://github.com/arnabbagxd/Brand-building-skills) |
| lead-magnets | Free guides and checklists that get you contacts | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| scorecard-marketing | Quiz funnels that find and sort leads | [wondelai/skills](https://github.com/wondelai/skills) |

### Reviews & word of mouth (8)

| Skill | What it does | Source |
|---|---|---|
| testimonial-request | Asks happy customers for a testimonial or review | [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills) |
| review-response-writer | Replies to Google and Facebook reviews, good and bad | [OneWave-AI/claude-skills](https://github.com/OneWave-AI/claude-skills) |
| referrals | Refer-a-friend and affiliate programs | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| contagious | Word of mouth and shareable ideas (STEPPS) | [wondelai/skills](https://github.com/wondelai/skills) |
| influencer-marketing | Working with creators and influencers | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| community-marketing | Growing a customer community or group | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| co-marketing | Joint promos with partner businesses | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| local-seo-manager | Google Business Profile, Maps ranking, local listings | [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills) |

### Plans & launches (5)

| Skill | What it does | Source |
|---|---|---|
| one-page-marketing | A one-page marketing plan, from stranger to raving fan | [wondelai/skills](https://github.com/wondelai/skills) |
| marketing-plan | A full marketing plan with priorities and budget | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| marketing-ideas | Marketing ideas when you have little time or budget | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| launch | Plans a product launch or promo | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |
| events | Webinars, booths and events, and following up after | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) |

## Where they come from

All third-party skills are MIT licensed and copied from their original GitHub repos with
their LICENSE: OneWave-AI/claude-skills, TheCraigHewitt/skills, alirezarezvani/claude-skills, arnabbagxd/Brand-building-skills, artemnovitckii/content-skills, coreyhaines31/marketingskills, getagentseal/founder-playbook, hardikpandya/stop-slop, minhnv0807/ai-business-skills, mohitagw15856/pm-claude-skills, vyralcontent/content-skills, wondelai/skills. The kit's own skills are in [skills/](skills/):
offer-builder, sales-objections, sales-followup, hook-killers, breakthrough-ads, image-generation, content-repurposing. sales-objections and sales-followup come from
zubair-trabzada/ai-sales-team-claude (MIT) with a name and description header added so Claude
can find them.

Every skill was checked before it was added: MIT license, updated in the last year, no
passwords or paid accounts needed, nothing that sends the owner's data anywhere or runs
downloaded code. Notes: local-seo-manager includes small offline Python helpers, a few skills
can read a web page if the owner gives them a link, and image-generation uses the owner's
own ChatGPT plan (and its daily image limits).

## Files

- [SETUP.md](SETUP.md): the steps Claude follows
- [skills.tsv](skills.tsv): the list (category, name, what it does, repo, path)
- [install-skills.sh](install-skills.sh): installs everything on the list (safe to re-run; skips what's there)
- [gen-readme.py](gen-readme.py): rebuilds this README from the list
- [skills/](skills/): the skills that live in this kit

## Takes about

5 to 10 minutes, including the ChatGPT sign-in.
