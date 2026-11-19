# Kit 01: Setup

**Everything installed in one go.** One prompt, one yes, one installer. The owner only steps
in for their Mac password (Homebrew) and one question about their business.

## The one prompt (owners paste this)

Open the Claude desktop app, click the **Code** tab, and paste:

```
Set me up with Kit 01 from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/01-setup/SETUP.md and follow it. Keep it simple for me.
```

## What happens

1. Claude lists everything it will install and asks **once**: "Can I start?"
2. **Mac:** the owner pastes Homebrew's install line in Terminal and types their Mac password.
   **Windows:** Claude installs Git.
3. **While Homebrew installs,** Claude creates `Documents/WORK FOLDER`, asks one question
   (what they sell and who buys, or a link to their page), and writes `WORK FOLDER/CLAUDE.md`.
4. Claude runs **one installer** (`setup.sh`): kit files, FFmpeg, and the skills.
5. Done checklist.

## What gets installed and why

| Install | What it does for the owner | Source |
|---|---|---|
| Homebrew (Mac) | The Mac's installer for the tools below; also brings Git | [brew.sh](https://brew.sh) |
| Kit files | The guides for Kits 02 and 03, in `Documents/work-without-working-kit` | this repo |
| FFmpeg | Lets Claude cut, convert and pull audio from video files | [ffmpeg.org](https://ffmpeg.org) |
| Grill Me + grilling | Interviews them until a plan is clear | [mattpocock/skills](https://github.com/mattpocock/skills) (MIT) |
| stop-slop | Claude's writing stops sounding like AI | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) (MIT) |
| dumbify | Explanations and customer messages stay simple | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) (MIT) |

Already in the Claude app, no install: Word, Excel, PowerPoint and PDF skills.

More tools (copywriting, customer-research, Anthropic's Small Business plugin and 70 others)
are in [Kit 02, the Skills Directory](../02-skills-directory/catalog.md).

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

## Takes about

15 to 25 minutes. Homebrew is the longest part (5 to 15 minutes), and the work folder is set
up while it runs. Helpers: owners need their Mac password.

