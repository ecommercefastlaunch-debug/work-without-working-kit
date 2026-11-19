# Kit 01: Setup (instructions for Claude)

You are setting up a business owner at the Work Without Working retreat. They have no
tech background. Their own words in the chat are your instructions; this file is the plan.

By the end they have: Homebrew (Mac), their kit files, a work folder with a CLAUDE.md about
their business, FFmpeg, Wispr Flow for talking to Claude in Tagalog or Taglish, and four
skills: Grill Me, grilling, stop-slop, dumbify.

**How to work**

- One step at a time. Before each step, say in one or two plain sentences what it does
  and why. After it, check it worked, then say "Step N done" before moving on.
- Ask before installing anything. Wait for a yes.
- Never type passwords, never create accounts, never enter payment details. The owner
  does those. If a step needs one, tell them exactly where to click or what to paste, and wait.
- If something fails twice, stop and tell them to raise their hand for a helper.
  Say what failed in one line so the helper can see it.
- Keep replies short. No jargon. If you must use a tech word, explain it in a few words.

---

## Step 1: Check the computer

Find out if this is a Mac or a Windows laptop. Steps 2 and 5 differ between them.

## Step 2: Homebrew (Mac) or Git (Windows)

### Mac: Homebrew

Homebrew is the Mac's app installer for tools like FFmpeg and Wispr Flow. Installing it also
installs Git, which downloads the kit files.

1. Check if it's already there: run `brew --version`, and if that fails, try
   `/opt/homebrew/bin/brew --version` and `/usr/local/bin/brew --version`. If any prints a
   version, Homebrew is installed: skip to point 5.
2. Homebrew needs their Mac password, so they run it themselves. Tell them:
   > "Press **Command + Space**, type **Terminal**, and press Return. In the Terminal
   > window, paste the line below and press Return. When it asks for your password, type
   > your Mac password (nothing shows while you type, that's normal) and press Return.
   > When it says 'Press RETURN to continue', press Return. It takes about 5 to 15 minutes.
   > If a window pops up asking to install command line tools, click **Install**."

   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

   This is Homebrew's official install line from https://brew.sh.
3. Wait for them to say it finished. Ask them to tell you if the last lines mention
   "Next steps".
4. Make `brew` available in new sessions. On Apple Silicon Macs (`/opt/homebrew` exists),
   add this line to `~/.zprofile` if it isn't already there:
   `eval "$(/opt/homebrew/bin/brew shellenv)"`. On Intel Macs Homebrew lives in
   `/usr/local` and needs nothing extra.
5. Check: `brew --version` (or the full path from point 1) and `git --version` both print
   versions.

### Windows: Git

1. Run `git --version`. If it prints a version, go to Step 3.
2. Otherwise run `winget install --id Git.Git -e`. If winget isn't available, tell them to
   download Git for Windows from https://git-scm.com/download/win and click **Next** on
   every screen.
3. They close and reopen the Claude app, start a new Code session, and paste the kit prompt
   again. You pick up from Step 1.

## Step 3: Download the kit files

Say: "Now I'm downloading your kit files: the guides for today's other exercises."

1. Find their Documents folder (`~/Documents` on Mac, `%USERPROFILE%\Documents` on Windows).
2. If `work-without-working-kit` is already there, run `git pull` inside it.
   Otherwise run, inside Documents:
   `git clone https://github.com/ecommercefastlaunch-debug/work-without-working-kit.git work-without-working-kit`
3. Check that `work-without-working-kit/kits/01-setup/SETUP.md` exists.

## Step 4: Build the work folder

1. Ask: "What's the name of your business?" Use the exact name they give.
2. Create this inside their Documents folder (skip any folder that already exists,
   and never delete or overwrite anything):

   ```
   WORK FOLDER/
     <Business Name>/
       00 Bottleneck/
       01 Business Info/
       02 AI Team/
       03 Outputs/
       04 Inbox/
   ```

3. Copy `work-without-working-kit/kits/01-setup/templates/CLAUDE.md` into
   `WORK FOLDER/<Business Name>/CLAUDE.md`. If a CLAUDE.md is already there, ask
   before changing it.
4. Fill it in by asking these, **one at a time**, waiting for each answer:
   1. What do you sell? (main products or services)
   2. Who buys from you? (describe your best customer)
   3. What are your prices? (rough is fine)
   4. How do you talk to customers? (formal, friendly, Taglish, English...)
5. Replace each `{{...}}` with their answer in their own words, tidied up but not
   made fancier. Leave "My bottleneck" as it is; Grill Me fills it later.
6. Show them the finished CLAUDE.md and ask if anything is wrong. Fix what they say.

## Step 5: FFmpeg and Wispr Flow

- **FFmpeg** lets Claude work with audio and video files: cut, convert, pull the sound out.
- **Wispr Flow** lets them talk instead of type, in Tagalog, Taglish or English, in any app,
  including Claude. Its free plan covers about 2,000 words a week.

Ask: "Can I install FFmpeg and Wispr Flow now?" Wait for yes.

**Mac:** run

```
bash ~/Documents/work-without-working-kit/kits/01-setup/install-mac-tools.sh
```

It installs both with Homebrew and skips anything already installed. It ends with a line
like `Done: 2 installed, 0 already there, 0 failed.`

**Windows:** run `winget install --id Gyan.FFmpeg -e` for FFmpeg. For Wispr Flow, tell them
to download it from https://wisprflow.ai and run the installer.

Then the owner sets up Wispr Flow (you can't do this part for them):

1. Open **Wispr Flow** (Mac: Command + Space, type "Wispr Flow").
2. Sign up or sign in with their own email. They type it themselves.
3. Allow the **microphone** and **accessibility** permissions when it asks. These are what
   let it type for them in other apps.
4. In its language settings, choose **Tagalog / Filipino** if it's listed, and keep English
   too. If Tagalog isn't listed, keep automatic language detection.
5. Learn the dictation shortcut it shows during setup.

Test it together: ask them to come back to this chat, hold the shortcut, and say a sentence
in Taglish, for example "Gusto kong i-automate yung pag-reply sa customers ko." If the words
appear in the chat, Wispr Flow works. If Tagalog words come out wrong, tell them it can still
be used in English, and note it for a helper.

## Step 6: Install the skills

Skills are job training for Claude: once installed, Claude knows how to do that job well
every time.

| Skill | What it does for them | From (MIT License) |
|---|---|---|
| Grill Me + grilling | Interviews them with hard questions until a plan is clear | mattpocock/skills |
| stop-slop | Makes everything Claude writes stop sounding like AI | hardikpandya/stop-slop |
| dumbify | Keeps explanations and customer messages simple | artemnovitckii/content-skills |

Ask: "Can I install these now?" Wait for yes. Then run (on Windows, in Git Bash):

```
bash ~/Documents/work-without-working-kit/kits/01-setup/install-skills.sh
```

It ends with a line like `Done: 4 installed, 0 already there, 0 failed.` Show them that
line. If anything says FAILED, run it once more; if it fails again, call a helper.

## Step 7: Done checklist

Show this, with a check or a cross for each line:

- Homebrew installed (Mac) / Git installed (Windows)
- Kit files downloaded to `Documents/work-without-working-kit`
- Work folder created: `Documents/WORK FOLDER/<Business Name>`
- CLAUDE.md written about their business
- FFmpeg installed
- Wispr Flow installed and tested in Taglish
- Skills installed: Grill Me, grilling, stop-slop, dumbify

Then tell them:

> You're set up. Start a **new** Code session, choose your business folder
> (`WORK FOLDER/<Business Name>`) as the folder, and wait for the next instruction.
> Your skills show up when you type `/`. Try `/grill-me`. And from now on, you can hold the
> Wispr Flow shortcut and just talk to me.
