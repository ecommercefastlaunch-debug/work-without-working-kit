# Kit 01: Setup

**Day 1, blocks 2 to 4.** Gets a new owner from "Claude is open" to "ready to be grilled".

## The one prompt (owners paste this)

Open the Claude desktop app, click the **Code** tab, and paste:

```
Set me up with Kit 01 from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/01-setup/SETUP.md and follow it step by step. Explain each step simply and ask me before you install anything.
```

## What Claude does with them

1. Checks the computer and makes sure Git works (Git is how Claude downloads kits and skills from GitHub)
2. Explains GitHub: no account is needed to use the kits
3. Downloads all the kits to their Documents folder
4. Builds their work folder and asks about their business to write its CLAUDE.md
5. Installs the starter skills (`install-skills.sh`)
6. Installs Anthropic's Small Business plugin (`install-plugin.sh`)
7. Gives a done checklist

## Starter skills and why

| Install | What it does for the owner | Source |
|---|---|---|
| Grill Me + grilling | Interviews them until a plan is clear | [mattpocock/skills](https://github.com/mattpocock/skills) (MIT) |
| stop-slop | Claude's writing stops sounding like AI | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) (MIT) |
| dumbify | Explanations and customer messages stay simple | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) (MIT) |
| copywriting, copy-editing, customer-research | Offers and pages, proofreading, what customers really want | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) (MIT) |
| Small Business plugin | 44 skills for running a small business; pauses before anything is sent or paid | [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins) (Apache-2.0) |

Already in the Claude app, no install: Word, Excel, PowerPoint and PDF skills.

**Left out on purpose:** claude-mem (asks for sign-in and a payment method for its trial,
and sends usage data by default), superpowers and the coding kits (built for developers),
impeccable and the UI kits (for Day 2's app build), Remotion (the video kit uses HyperFrames),
and the research servers that need paid API keys.

## They leave with

- [ ] `git --version` shows a version
- [ ] `Documents/work-without-working-kit` downloaded
- [ ] `Documents/WORK FOLDER/<Business>/` with 5 folders inside
- [ ] `CLAUDE.md` about their business, in their own words
- [ ] The starter skills, ready when they type `/`
- [ ] The Small Business plugin

## Takes about

25 to 45 minutes. Most of it is the Git install on a laptop that doesn't have it, and the
business questions. Helpers: the Mac Git install opens a popup the owner must click.
