# Work Without Working Setup Kit (Kit 01)

**Claude installs everything automatically.** The owner pastes one prompt, answers one
question about their business, and only approves what the computer asks for: their Mac
password for Homebrew, an **Allow** button, or (on Windows) accepting the programs' terms.

## The one prompt (owners paste this)

Open the Claude desktop app, click the **Code** tab, and paste:

```
Set me up with the Work Without Working Setup Kit from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/01-setup/SETUP.md and install everything for me. I'll allow what's needed.
```

## What happens

1. Claude says what it's installing and starts right away (no "can I start?").
2. **Mac:** Claude opens Terminal with Homebrew's installer already running; the owner clicks
   OK and types their Mac password. **Windows:** Claude asks once to accept the programs' terms.
3. **While Homebrew installs,** Claude creates `Documents/WORK FOLDER`, asks one question
   (what they sell and who buys, or a link to their page), and writes `WORK FOLDER/CLAUDE.md`.
4. Claude runs **one installer** (`setup.sh`): Git, the GitHub app, FFmpeg and Node.js.
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

Claude skills are a separate kit: [Kit 02 Sales and Marketing Skills](../02-skills/).

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

## Takes about

15 to 25 minutes. Homebrew is the longest part (5 to 15 minutes), and the work folder is set
up while it runs. Helpers: owners need their Mac password, and should click OK when asked if
Claude can control Terminal.

