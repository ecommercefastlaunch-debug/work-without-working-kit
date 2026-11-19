# Kit 01: Setup, one step at a time (instructions for Claude)

You are setting up a business owner at the Work Without Working retreat. They have no tech
background. The room does this **together, one step at a time**: the trainer calls a step,
everyone pastes it, and nobody moves on until their step shows a check.

**Do only the step the owner asked for.** When it's done and checked, show the check, tell
them the next step's prompt, and **stop**. Never start the next step on your own.

| Step | What it does | The owner pastes |
|---|---|---|
| 1 | Homebrew (Mac) or winget check (Windows) | the start prompt (see the Kit 01 README) |
| 2 | WORK FOLDER and its CLAUDE.md | `Kit 01 Step 2` |
| 3 | Git | `Kit 01 Step 3` |
| 4 | FFmpeg | `Kit 01 Step 4` |
| 5 | Node.js | `Kit 01 Step 5` |
| 6 | Google Chrome | `Kit 01 Step 6` |
| 7 | Kit files | `Kit 01 Step 7` |
| 8 | Skills: stop-slop and dumbify | `Kit 01 Step 8` |
| 9 | Final check | `Kit 01 Step 9` |

**How to work**

- The owner pasting a step's prompt means yes to that install. Don't ask "can I install
  this?" again. Run it.
- Before each step, one line on what it is and why they need it. After it, a check (✓) or a
  cross (✗) and one line on what happened.
- Short, friendly updates in plain words. No jargon. Show the command you ran, so the owner
  sees what happened, but don't explain it unless they ask.
- Never type passwords, never create accounts, never enter payment details. When the computer
  asks for one of those, tell the owner exactly what to do and wait.
- If something is already installed, say so, show ✓, and move on to the next-step message.
- If a step fails twice, tell them to raise their hand for a helper and say what failed in one
  line.
- If an owner pastes a later step in a new session, read this file first, then do that step.
  If an earlier step is missing (for example no Homebrew on a Mac), say which step to do first.

**Mac: finding Homebrew.** After Step 1, `brew` may not be on the PATH in your shell yet. Use
`/opt/homebrew/bin/brew` (Apple Silicon) or `/usr/local/bin/brew` (Intel) when `brew` isn't
found. Set `HOMEBREW_NO_AUTO_UPDATE=1` to keep installs fast.

**Windows: winget.** Add `--accept-package-agreements --accept-source-agreements` to every
`winget install` only after the owner said yes to that in Step 1. After a winget install, the
new program may need the Claude app closed and reopened before it's found.

---

## Step 1: Homebrew (Mac) / winget check (Windows)

First find out if this is a Mac or a Windows laptop.

**Mac.** Homebrew is the Mac's installer for the tools in the next steps.

1. Check: `brew --version`, or `/opt/homebrew/bin/brew --version`, or
   `/usr/local/bin/brew --version`. If one prints a version: ✓, done.
2. If it's missing, open Terminal with Homebrew's official installer already running (from
   https://brew.sh):

   ```
   osascript -e 'tell application "Terminal" to activate' -e 'tell application "Terminal" to do script "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""'
   ```

   Tell them:

   > A Terminal window just opened. If a box asks whether Claude can control Terminal, click
   > **OK**. When the Terminal asks for your **Mac password**, type it (nothing shows while
   > you type, that's normal) and press Return. When it says "Press RETURN to continue",
   > press Return. It takes 5 to 15 minutes. You can paste **Kit 01 Step 2** while it runs.

   If the Terminal window didn't open (for example they clicked Don't Allow), have them open
   it themselves (Command + Space, type Terminal, Return) and paste:
   `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
3. When the owner says it finished (or when they paste a later step), check again with the
   full paths above. On Apple Silicon (`/opt/homebrew` exists), add
   `eval "$(/opt/homebrew/bin/brew shellenv)"` to `~/.zprofile` if it isn't there yet. ✓

**Windows.** winget is Windows' built-in installer.

1. Check: `winget --version`. If it's missing, they install **App Installer** from the
   Microsoft Store, then paste Step 1 again.
2. Ask once: "Windows asks you to accept the terms of each program we install (Git, FFmpeg,
   Node.js, Chrome). Is it OK if I accept them for you in the next steps?" Remember the
   answer for this session. ✓

Next: "Paste **Kit 01 Step 2** to make your WORK FOLDER."

## Step 2: WORK FOLDER

Their home base: everything they do with Claude lives here, one folder per project.

1. Create `WORK FOLDER` inside their Documents folder (`~/Documents/WORK FOLDER`). If it
   already exists, use it and never delete or overwrite anything in it.
2. Ask **one** question:
   > "In one or two sentences, what do you sell and who buys it? Or paste your Facebook
   > page or website link and I'll read it."
   If they paste a link, read the page and summarize the business in 2 or 3 lines.
3. Write `WORK FOLDER/CLAUDE.md` from the template at
   `https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/01-setup/templates/CLAUDE.md`.
   Replace `{{BUSINESS}}` with 2 or 3 plain lines in their words. Keep the rest of the
   template as it is. If a CLAUDE.md already exists there, ask before changing it.
4. Show them the folder in one picture:
   ```
   Documents/
     WORK FOLDER/
       CLAUDE.md          your business + the folder rules
       <project>/         one folder per project, made when you start it
         Outputs/         everything Claude makes for it
   ```
   ✓

Next: "Paste **Kit 01 Step 3** to install Git."

## Step 3: Git

Git downloads the kits and skills from GitHub.

- Check: `git --version`. On a Mac, `/usr/bin/git` counts once Homebrew is in (Homebrew
  installs Apple's tools, which include Git). If it prints a version: ✓.
- Mac, if missing: `brew install git`
- Windows, if missing: `winget install --id Git.Git -e --silent` (plus the accept flags), then
  they close and reopen the Claude app and paste Step 3 again to check.
- Check with `git --version`. ✓

Next: "Paste **Kit 01 Step 4** to install FFmpeg."

## Step 4: FFmpeg

FFmpeg lets Claude cut, convert and pull the audio out of video files. Kit 03 needs it.

- Check: `ffmpeg -version`. If it prints a version: ✓.
- Mac: `brew install ffmpeg` (2 to 8 minutes; it downloads several parts, that's normal).
- Windows: `winget install --id Gyan.FFmpeg -e --silent` (plus the accept flags).
- Check with `ffmpeg -version`. ✓

Next: "Paste **Kit 01 Step 5** to install Node.js."

## Step 5: Node.js

Node.js runs the video editor in Kit 03 and other tools.

- Check: `node -v`. If it prints a version: ✓.
- Mac: `brew install node`
- Windows: `winget install --id OpenJS.NodeJS.LTS -e --silent` (plus the accept flags).
- Check with `node -v` and `npm -v`. ✓

Next: "Paste **Kit 01 Step 6** to install Chrome."

## Step 6: Google Chrome

The video editor in Kit 03 uses Chrome to render videos.

- Mac check: `/Applications/Google Chrome.app` or `~/Applications/Google Chrome.app` exists.
  If missing: `brew install --cask google-chrome`.
- Windows check: `winget list --id Google.Chrome -e`. If missing:
  `winget install --id Google.Chrome -e --silent` (plus the accept flags).
- If the install fails, they download it from https://www.google.com/chrome. ✓

Next: "Paste **Kit 01 Step 7** to download the kit files."

## Step 7: Kit files

The guides for Kits 02 and 03, saved on their laptop.

- If `~/Documents/work-without-working-kit` already exists, update it:
  `git -C ~/Documents/work-without-working-kit pull --ff-only`
- Otherwise:
  `git clone https://github.com/ecommercefastlaunch-debug/work-without-working-kit.git ~/Documents/work-without-working-kit`
- Check that `~/Documents/work-without-working-kit/kits` exists. ✓

Next: "Paste **Kit 01 Step 8** to install your two writing skills."

## Step 8: Skills (stop-slop and dumbify)

Skills are add-ons that teach Claude a way of working. These two are free, from their
creators' GitHub pages:

- **stop-slop** keeps Claude's writing from sounding like AI
  (github.com/hardikpandya/stop-slop, MIT license).
- **dumbify** keeps explanations and customer messages simple
  (github.com/artemnovitckii/content-skills, MIT license).

Install each into `~/.claude/skills` only if that folder doesn't exist yet:

```
mkdir -p ~/.claude/skills && cd "$(mktemp -d)"
git clone -q --depth 1 https://github.com/hardikpandya/stop-slop.git stop-slop
git clone -q --depth 1 https://github.com/artemnovitckii/content-skills.git content-skills
[ -e ~/.claude/skills/stop-slop ] || { cp -R stop-slop ~/.claude/skills/stop-slop && rm -rf ~/.claude/skills/stop-slop/.git ~/.claude/skills/stop-slop/.github; }
[ -e ~/.claude/skills/dumbify ] || { cp -R content-skills/dumbify ~/.claude/skills/dumbify && cp -n content-skills/LICENSE ~/.claude/skills/dumbify/ 2>/dev/null; true; }
ls ~/.claude/skills/stop-slop/SKILL.md ~/.claude/skills/dumbify/SKILL.md
```

Both `SKILL.md` files listed: ✓. Tell them the skills work in new sessions, and that Kit 02
has 74 more.

Next: "Paste **Kit 01 Step 9** for the final check."

## Step 9: Final check

Run each check again and show a list with ✓ or ✗:

- Homebrew (Mac): `brew --version`
- Git: `git --version`
- FFmpeg: `ffmpeg -version`
- Node.js: `node -v`
- Google Chrome
- Kit files in `Documents/work-without-working-kit`
- `Documents/WORK FOLDER` with CLAUDE.md
- Skills: stop-slop, dumbify

For any ✗, say which step to paste again. If everything is ✓, tell them:

> You're set up. Start a **new** Code session and choose your **WORK FOLDER**. Tell me what
> you want to work on and I'll make a folder for it. You can write to me in Tagalog, Taglish
> or English. For more tools, run Kit 02, the Skills Directory. For video editing, Kit 03.

---

**Helpers only:** `setup.sh` in this folder does Steps 3 to 8 in one run (after Homebrew on a
Mac). Use it to catch up an owner who fell behind:
`curl -fsSL https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/01-setup/setup.sh -o /tmp/wwk-setup.sh && bash /tmp/wwk-setup.sh`
(Windows: add `--accept-terms` after the owner agreed.)
