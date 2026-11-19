# Kit 01: Setup

**Claude installs everything automatically.** The owner pastes one prompt, answers one
question about their business, and only approves what the computer asks for: their Mac
password for Homebrew, an **Allow** button, or (on Windows) accepting the programs' terms.

## The one prompt (owners paste this)

Open the Claude desktop app, click the **Code** tab, and paste:

```
Set me up with Kit 01 from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/01-setup/SETUP.md and install everything for me. I'll allow what's needed.
```

## What happens

1. Claude says what it's installing and starts right away (no "can I start?").
2. **Mac:** Claude opens Terminal with Homebrew's installer already running; the owner clicks
   OK and types their Mac password. **Windows:** Claude asks once to accept the programs' terms.
3. **While Homebrew installs,** Claude creates `Documents/WORK FOLDER`, asks one question
   (what they sell and who buys, or a link to their page), and writes `WORK FOLDER/CLAUDE.md`.
4. Claude runs **one installer** (`setup.sh`): Git, GitHub, FFmpeg, Node.js, the kit files, and
   the Claude skills.
5. **GitHub account:** the owner signs up (if new) and signs in themselves; Claude opens the
   pages. They can skip it and do it later.
6. Done checklist.

## What gets installed and why

| Install | What it does for the owner | Source |
|---|---|---|
| Homebrew (Mac) | The Mac's installer for the tools below | [brew.sh](https://brew.sh) |
| Git | Downloads the kits and skills (Windows: Git for Windows) | [git-scm.com](https://git-scm.com) |
| GitHub | The GitHub app (`gh`) plus the owner's own account, to save and share their work later | [cli.github.com](https://cli.github.com) |
| FFmpeg | Lets Claude cut, convert and pull audio from video files | [ffmpeg.org](https://ffmpeg.org) |
| Node.js | Runs tools like video editors and app builders | [nodejs.org](https://nodejs.org) |
| Kit files | This kit, saved in `Documents/work-without-working-kit` | this repo |

**Claude skills (12)**, installed into `~/.claude/skills`:

| Skill | What it does for the owner | Source |
|---|---|---|
| stop-slop | Claude's writing stops sounding like AI | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) (MIT) |
| dumbify | Explanations and customer messages stay simple | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) (MIT) |
| storytelling | Gives scripts and posts a story that holds attention | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) (MIT) |
| copywriting | Offers, landing pages, headlines and product pages | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) (MIT) |
| product-marketing | Positioning: who it's for, why you, what to say first | coreyhaines31/marketingskills (MIT) |
| customer-research | Turns customer messages and reviews into what customers really want | coreyhaines31/marketingskills (MIT) |
| social | Posts, carousels and calendars for Facebook, Instagram, TikTok, LinkedIn | coreyhaines31/marketingskills (MIT) |
| ad-creative | Ad headlines and copy variations for Meta, Google, TikTok | coreyhaines31/marketingskills (MIT) |
| content-repurposing | One piece of content into many posts | this kit ([skills/](skills/)) |
| hook-killers | Finds why an opening line is weak and fixes it | this kit ([skills/](skills/); MIT, Artem Novitckii) |
| offer-builder | Market research, competitors, positioning and offer statements from what they sell | this kit ([skills/](skills/)) |
| breakthrough-ads | 10 ad scripts per request from different angles, using Breakthrough Advertising principles | this kit ([skills/](skills/)) |

Already in the Claude app, no install: Word, Excel, PowerPoint and PDF skills.

## The WORK FOLDER

```
Documents/
  WORK FOLDER/
    CLAUDE.md            their business in 2-3 lines + the folder rules
    <project name>/      one folder per project, business or client, made when they start it
      Outputs/           everything Claude makes for that project
```

Claude reads `WORK FOLDER/CLAUDE.md` in every session inside the folder, so it always knows the
business and the rules: new project, new folder; results go in its Outputs.

## Files

- [SETUP.md](SETUP.md): the steps Claude follows
- [setup.sh](setup.sh): the one-shot installer (safe to re-run; skips what's done)
- [templates/CLAUDE.md](templates/CLAUDE.md): the business file template
- [skills/](skills/): the Claude skills that live in this kit (content-repurposing, hook-killers, offer-builder, breakthrough-ads)

## Takes about

15 to 25 minutes. Homebrew is the longest part (5 to 15 minutes), and the work folder is set
up while it runs. Helpers: owners need their Mac password, and should click OK when asked if
Claude can control Terminal.

