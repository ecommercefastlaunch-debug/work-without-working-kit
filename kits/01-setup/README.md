# Kit 01: Setup

**Day 1, blocks 2 to 4.** Gets a new owner from "Claude is open" to "ready to be grilled".

## The one prompt (owners paste this)

Open the Claude desktop app, click the **Code** tab, and paste:

```
Set me up with Kit 01 from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/01-setup/SETUP.md and follow it step by step. Explain each step simply and ask me before you install anything.
```

## What Claude does with them

1. Checks if it's a Mac or Windows laptop
2. **Mac:** the owner installs Homebrew by pasting one line in Terminal (it needs their Mac
   password, so they run it themselves). **Windows:** installs Git with winget
3. Downloads the kit files to their Documents folder
4. Builds their work folder and asks about their business to write its CLAUDE.md
5. Installs FFmpeg and Wispr Flow (`install-mac-tools.sh`), then the owner signs in to
   Wispr Flow, allows the microphone, picks Tagalog, and tests it by talking to Claude
6. Installs the skills (`install-skills.sh`)
7. Gives a done checklist

## What gets installed and why

| Install | What it does for the owner | Source |
|---|---|---|
| Homebrew (Mac) | The Mac's installer for the tools below; also brings Git | [brew.sh](https://brew.sh) |
| FFmpeg | Lets Claude cut, convert and pull audio from video files | [ffmpeg.org](https://ffmpeg.org) |
| Wispr Flow | Talk instead of type, in Tagalog, Taglish or English, in any app. Free plan: about 2,000 words a week | [wisprflow.ai](https://wisprflow.ai) |
| Grill Me + grilling | Interviews them until a plan is clear | [mattpocock/skills](https://github.com/mattpocock/skills) (MIT) |
| stop-slop | Claude's writing stops sounding like AI | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) (MIT) |
| dumbify | Explanations and customer messages stay simple | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) (MIT) |

Already in the Claude app, no install: Word, Excel, PowerPoint and PDF skills.

Everything else (copywriting, customer-research, Anthropic's Small Business plugin, and 70
more) is in the [Kit 02 catalog](../02-build-your-tool/catalog.md), where owners pick what
fits their business.

## They leave with

- [ ] Homebrew (Mac) or Git (Windows)
- [ ] `Documents/work-without-working-kit` downloaded
- [ ] `Documents/WORK FOLDER/<Business>/` with 5 folders inside
- [ ] `CLAUDE.md` about their business, in their own words
- [ ] FFmpeg
- [ ] Wispr Flow, signed in and tested in Taglish
- [ ] Grill Me, grilling, stop-slop, dumbify, ready when they type `/`

## Takes about

30 to 50 minutes. The Homebrew install is the longest part (5 to 15 minutes, more on slow
Wi-Fi). Helpers: owners need their Mac password for Homebrew, their own email for Wispr Flow,
and must click Allow for the microphone and accessibility permissions.

**Tagalog in Wispr Flow:** it lists 100+ languages, but we haven't confirmed Tagalog by name.
Test it on one laptop before the event.
