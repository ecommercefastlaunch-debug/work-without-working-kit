# Kit 01: Setup, one step at a time

The room installs together, **one step at a time**. The trainer calls a step, everyone pastes
it in Claude, and nobody moves on until Claude shows a ✓. Claude does the work; the owner
only approves what the computer asks for: their Mac password for Homebrew, an **Allow**
button, or (on Windows) accepting the programs' terms.

## The prompts (owners paste these, in the Claude app's Code tab)

**Step 1** (the start prompt, it tells Claude where the guide is):

```
Set me up with Kit 01 from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/01-setup/SETUP.md and do Step 1 only.
```

**Steps 2 to 9**, one at a time, in the same session:

| Step | Paste | What happens | About |
|---|---|---|---|
| 1 | the start prompt | **Mac:** Homebrew. Terminal opens; the owner clicks OK and types their Mac password. **Windows:** checks winget and asks once to accept the programs' terms | 5–15 min |
| 2 | `Kit 01 Step 2` | Creates `Documents/WORK FOLDER`, asks what they sell, writes `WORK FOLDER/CLAUDE.md` (can run while Homebrew installs) | 3 min |
| 3 | `Kit 01 Step 3` | Git | 1–2 min |
| 4 | `Kit 01 Step 4` | FFmpeg | 2–8 min |
| 5 | `Kit 01 Step 5` | Node.js | 1–2 min |
| 6 | `Kit 01 Step 6` | Google Chrome (skipped if they have it) | 1–3 min |
| 7 | `Kit 01 Step 7` | Kit files, into `Documents/work-without-working-kit` | 1 min |
| 8 | `Kit 01 Step 8` | Skills: stop-slop and dumbify | 1 min |
| 9 | `Kit 01 Step 9` | Final check: ✓ or ✗ for everything | 1 min |

About 20 to 35 minutes for the room. If someone opened a new session halfway, they paste the
start prompt again, then their step.

## What gets installed and why

| Install | What it does for the owner | Source |
|---|---|---|
| Homebrew (Mac) | The Mac's installer for the tools below | [brew.sh](https://brew.sh) |
| Git | Downloads the kits and skills (Windows: Git for Windows) | [git-scm.com](https://git-scm.com) |
| FFmpeg | Lets Claude cut, convert and pull audio from video files | [ffmpeg.org](https://ffmpeg.org) |
| Node.js | Runs the video editor (Kit 03) and other tools | [nodejs.org](https://nodejs.org) |
| Google Chrome | Needed by the video editor to render videos | [google.com/chrome](https://www.google.com/chrome) |
| Kit files | The guides for Kits 02 and 03, in `Documents/work-without-working-kit` | this repo |
| stop-slop | Claude's writing stops sounding like AI | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) (MIT) |
| dumbify | Explanations and customer messages stay simple | [artemnovitckii/content-skills](https://github.com/artemnovitckii/content-skills) (MIT) |

Already in the Claude app, no install: Word, Excel, PowerPoint and PDF skills.

More tools (Grill Me, copywriting, customer-research, Anthropic's Small Business plugin and 70 others)
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
- [setup.sh](setup.sh): helpers only, does Steps 3 to 8 in one run to catch up someone who fell behind
- [templates/CLAUDE.md](templates/CLAUDE.md): the business file template

## Tips for the trainer

- Start Step 1 first thing: Homebrew is the longest part. Do Step 2 while it runs.
- Owners need their Mac password, and should click **OK** when asked if Claude can control Terminal.
- Wait for a ✓ from the room before calling the next step. Anyone with a ✗ twice raises their hand.
