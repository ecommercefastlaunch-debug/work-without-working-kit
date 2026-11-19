# Kit 01: Setup (instructions for Claude)

You are setting up a business owner at the Work Without Working retreat. They have no tech
background. By pasting the Kit 01 prompt, they asked you to install everything on this list,
so **install it automatically**. Don't ask "can I install this?" item by item. They only step
in when the computer itself needs them: typing their password, clicking **Allow** or **Yes**,
or accepting terms on Windows.

**What gets installed:** Homebrew (Mac), Git, FFmpeg, Node.js, Google Chrome, the kit files,
and two skills, stop-slop and dumbify. **What gets created:** their WORK FOLDER with a short
CLAUDE.md.

**How to work**

- Short, friendly updates in plain words. No jargon.
- Never type passwords, never create accounts, never enter payment details. When the computer
  asks for one of those, tell the owner exactly what to do and wait.
- If something fails twice, tell them to raise their hand for a helper and say what failed in
  one line.

---

## Step 1: Heads-up (no question needed)

Find out if this is a Mac or a Windows laptop. Then say, in your own words:

> I'm setting everything up for you now: Git, FFmpeg, Node.js, Chrome, your WORK FOLDER, and
> two writing skills. It takes about 15 to 25 minutes. If your computer asks for your
> password or shows an **Allow** button, go ahead and approve it. I'll tell you when.

Then go straight to Step 2.

## Step 2: Homebrew (Mac only)

Check for Homebrew: `brew --version`, or `/opt/homebrew/bin/brew --version`, or
`/usr/local/bin/brew --version`. If one prints a version, go to Step 3.

If it's missing, open Terminal with Homebrew's official installer already running (from
https://brew.sh):

```
osascript -e 'tell application "Terminal" to activate' -e 'tell application "Terminal" to do script "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""'
```

Tell them:

> A Terminal window just opened. If a box asks whether Claude can control Terminal, click
> **OK**. When the Terminal asks for your **Mac password**, type it (nothing shows while you
> type, that's normal) and press Return. When it says "Press RETURN to continue", press
> Return. Then leave it running and come back here.

If the Terminal window didn't open (for example they clicked Don't Allow), have them open it
themselves (Command + Space, type Terminal, Return) and paste the same install line:
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

While it installs (5 to 15 minutes), do Step 3.

## Step 3: WORK FOLDER (while Homebrew installs)

1. Create `WORK FOLDER` inside their Documents folder (`~/Documents/WORK FOLDER`). If it
   already exists, use it and never delete or overwrite anything in it.
2. Ask **one** question:
   > "In one or two sentences, what do you sell and who buys it? Or paste your Facebook
   > page or website link and I'll read it."
   If they paste a link, read the page and summarize the business in 2 or 3 lines.
3. Write `WORK FOLDER/CLAUDE.md` from the template at
   `https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/01-setup/templates/CLAUDE.md`
   (or the local copy if the kit is already downloaded). Replace `{{BUSINESS}}` with 2 or 3
   plain lines in their words. Keep the rest of the template as it is: it tells Claude to give
   every new project its own folder with an `Outputs` folder inside. If a CLAUDE.md already
   exists there, ask before changing it.
4. Tell them in one line: "Your WORK FOLDER is ready. Every new project gets its own folder
   inside it, and everything I make goes in that project's Outputs folder."

## Step 4: Install everything else, in one run

**Mac**

1. Check Homebrew finished: run `/opt/homebrew/bin/brew --version` or
   `/usr/local/bin/brew --version`. If neither works yet, ask them what the Terminal window
   shows, and wait.
2. On Apple Silicon Macs (`/opt/homebrew` exists), add
   `eval "$(/opt/homebrew/bin/brew shellenv)"` to `~/.zprofile` if it isn't there yet.
3. Get the installer and run it:

   ```
   curl -fsSL https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/01-setup/setup.sh -o /tmp/wwk-setup.sh && bash /tmp/wwk-setup.sh
   ```

**Windows**

1. Tell them: "Windows asks you to accept the terms of each program (Git, FFmpeg, Node.js,
   Chrome). Is it OK if I accept them for you?" Wait for yes.
2. If Git Bash isn't there yet, run
   `winget install --id Git.Git -e --accept-package-agreements --accept-source-agreements`,
   then they close and reopen the Claude app and paste the kit prompt again.
3. In Git Bash, download and run the installer with the terms accepted:
   `curl -fsSL <same setup.sh link as above> -o /tmp/wwk-setup.sh && bash /tmp/wwk-setup.sh --accept-terms`
4. When Windows shows "Do you want to allow this app to make changes?", they click **Yes**.

**Both**

The installer prints one line per item (`INSTALLED`, `ALREADY`, `FAILED`) and ends with
`Done: N installed, N already there, N failed.`

- `NEEDS HOMEBREW`: Homebrew isn't finished yet. Wait, then run it again.
- `NEEDS GIT` (Windows): close and reopen the Claude app, then run it again.
- `FAILED`: run it once more; it skips what's done. Still failing: helper.

## Step 5: Done

Show a check or a cross for each:

- Homebrew (Mac)
- Git
- FFmpeg
- Node.js
- Google Chrome
- Kit files in `Documents/work-without-working-kit`
- `Documents/WORK FOLDER` with CLAUDE.md
- Skills: stop-slop, dumbify

Then tell them:

> You're set up. Start a **new** Code session and choose your **WORK FOLDER**. Tell me what
> you want to work on and I'll make a folder for it. You can write to me in Tagalog, Taglish
> or English. For more tools, run Kit 02, the Skills Directory. For video editing, Kit 03.
