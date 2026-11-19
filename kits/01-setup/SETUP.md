# Kit 01: Setup (instructions for Claude)

You are setting up a business owner at the Work Without Working retreat, in one go. They
have no tech background. Their own words in the chat are your instructions; this file is
the plan.

**What they get:** Homebrew (Mac), the kit files, a work folder with a CLAUDE.md about their
business, FFmpeg, and the skills Grill Me, grilling, stop-slop and dumbify.

**How to work**

- Ask for permission **once**, at the start, for everything on this list. After that yes,
  don't ask again for each item.
- Keep moving. Short updates, no jargon. If you must use a tech word, explain it in a few words.
- Never type passwords, never create accounts, never enter payment details. The owner does
  those. Tell them exactly where to click or what to paste, and wait.
- If something fails twice, tell them to raise their hand for a helper and say what failed
  in one line.

---

## Step 1: One message, one yes

Find out if this is a Mac or a Windows laptop. Then send one message like this:

> I'll set up everything you need for today in one go:
> - **Homebrew**, the Mac's installer (you'll paste one line and type your Mac password)
> - **Your WORK FOLDER**, where everything you do with me will live (one quick question)
> - **FFmpeg**, so I can work with your videos and audio
> - **Skills:** Grill Me, stop-slop, dumbify
>
> It takes about 15 to 25 minutes. Can I start?

Wait for yes.

## Step 2: Homebrew (Mac) or Git (Windows)

**Mac.** Check for Homebrew: `brew --version`, or `/opt/homebrew/bin/brew --version`, or
`/usr/local/bin/brew --version`. If one prints a version, go to Step 3.

If it's missing, the owner installs it (it needs their Mac password). Tell them:

> Press **Command + Space**, type **Terminal**, press Return. Paste this line and press Return:
>
> `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
>
> Type your Mac password when asked (nothing shows while you type, that's normal) and press
> Return. Press Return again when it says "Press RETURN to continue". If a window asks to
> install command line tools, click **Install**. It takes 5 to 15 minutes. **Leave it
> running and come back here: we'll do your work folder while it installs.**

This is Homebrew's official install line from https://brew.sh. Go straight to Step 3 while it runs.

**Windows.** Run `git --version`. If it's missing, run `winget install --id Git.Git -e`
(or have them install Git from https://git-scm.com/download/win), then they close and reopen
the Claude app and paste the kit prompt again.

## Step 3: WORK FOLDER (while Homebrew installs)

1. Create `WORK FOLDER` inside their Documents folder (`~/Documents/WORK FOLDER`). If it
   already exists, use it and never delete or overwrite anything in it. Nothing else goes
   inside yet: each new project gets its own folder later, when they start it.
2. Ask **one** question:
   > "In one or two sentences, what do you sell and who buys it? Or paste your Facebook
   > page or website link and I'll read it."
   If they paste a link, read the page and summarize the business in 2 or 3 lines.
3. Write `WORK FOLDER/CLAUDE.md` from the template at
   `https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/01-setup/templates/CLAUDE.md`
   (or the local copy if the kit is already downloaded). Replace `{{BUSINESS}}` with 2 or 3
   plain lines in their words. Keep the rest of the template as it is: it tells Claude to
   give every new project its own folder with an `Outputs` folder inside. If a CLAUDE.md
   already exists there, ask before changing it.
4. Tell them in one line: "Your WORK FOLDER is ready. Every new project gets its own folder
   inside it, and everything I make goes in that project's Outputs folder."

## Step 4: Install everything else, in one run

1. **Mac:** make sure Homebrew finished. Ask: "Did the Terminal window finish? What do the
   last lines say?" On Apple Silicon Macs (`/opt/homebrew` exists), add
   `eval "$(/opt/homebrew/bin/brew shellenv)"` to `~/.zprofile` if it isn't there yet.
2. Download the kit if it isn't there yet:
   `git clone https://github.com/ecommercefastlaunch-debug/work-without-working-kit.git ~/Documents/work-without-working-kit`
3. Run the installer once:

   ```
   bash ~/Documents/work-without-working-kit/kits/01-setup/setup.sh
   ```

   It installs FFmpeg and the four skills, and updates the kit files. It prints
   one line per item (`INSTALLED`, `ALREADY`, `FAILED`, or `TODO` on Windows) and ends with
   `Done: N installed, N already there, N failed.`
4. If it prints `NEEDS HOMEBREW`, Homebrew isn't finished: wait, then run it again.
   If anything says `FAILED`, run it once more; it skips what's done. Still failing: helper.
5. **Windows:** do the `TODO` line it prints (FFmpeg with winget).

## Step 5: Done

Show a check or a cross for each:

- Homebrew (Mac) / Git (Windows)
- Kit files in `Documents/work-without-working-kit`
- `Documents/WORK FOLDER` with CLAUDE.md
- FFmpeg
- Skills: Grill Me, grilling, stop-slop, dumbify

Then tell them:

> You're set up. Start a **new** Code session and choose your **WORK FOLDER**. Tell me what
> you want to work on and I'll make a folder for it. Type `/` to see your skills. You can write
> to me in Tagalog, Taglish or English. When you want more tools, run Kit 02, the Skills Directory.
