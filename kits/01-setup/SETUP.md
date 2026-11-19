# Kit 01: Setup (instructions for Claude)

You are setting up a business owner at the Work Without Working retreat, in one go. They
have no tech background. Their own words in the chat are your instructions; this file is
the plan.

**What they get:** Homebrew (Mac), the kit files, a work folder with a CLAUDE.md about their
business, FFmpeg, Wispr Flow (talk to Claude in Tagalog, Taglish or English), and the skills
Grill Me, grilling, stop-slop and dumbify.

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
> - **Your work folder** and a short file about your business (I'll ask 4 quick questions)
> - **FFmpeg**, so I can work with your videos and audio
> - **Wispr Flow**, so you can talk to me in Tagalog or Taglish instead of typing (you'll
>   sign in with your email)
> - **Skills:** Grill Me, stop-slop, dumbify
>
> It takes about 20 to 30 minutes. Can I start?

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
> running and come back here: we'll do your business questions while it installs.**

This is Homebrew's official install line from https://brew.sh. Go straight to Step 3 while it runs.

**Windows.** Run `git --version`. If it's missing, run `winget install --id Git.Git -e`
(or have them install Git from https://git-scm.com/download/win), then they close and reopen
the Claude app and paste the kit prompt again.

## Step 3: Work folder and CLAUDE.md (while Homebrew installs)

1. Ask: "What's the name of your business?" Use the exact name.
2. Create inside their Documents folder, skipping anything that already exists and never
   deleting or overwriting:

   ```
   WORK FOLDER/
     <Business Name>/
       00 Bottleneck/
       01 Business Info/
       02 AI Team/
       03 Outputs/
       04 Inbox/
   ```

3. Ask these **one at a time**:
   1. What do you sell? (main products or services)
   2. Who buys from you? (describe your best customer)
   3. What are your prices? (rough is fine)
   4. How do you talk to customers? (formal, friendly, Taglish, English...)
4. Write `WORK FOLDER/<Business Name>/CLAUDE.md` from the template at
   `https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/01-setup/templates/CLAUDE.md`
   (or the local copy if the kit is already downloaded). Put their answers in their own
   words. Leave "My bottleneck" as it is; Grill Me fills it later. If a CLAUDE.md already
   exists, ask before changing it.
5. Show it in a few lines and fix anything they correct.

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

   It installs FFmpeg, Wispr Flow and the four skills, and updates the kit files. It prints
   one line per item (`INSTALLED`, `ALREADY`, `FAILED`, or `TODO` on Windows) and ends with
   `Done: N installed, N already there, N failed.`
4. If it prints `NEEDS HOMEBREW`, Homebrew isn't finished: wait, then run it again.
   If anything says `FAILED`, run it once more; it skips what's done. Still failing: helper.
5. **Windows:** do the `TODO` lines it prints (FFmpeg with winget, Wispr Flow from its website).

## Step 5: Wispr Flow (the owner does this part)

1. Open **Wispr Flow** (Mac: Command + Space, type "Wispr Flow").
2. Sign up or sign in with their own email. They type it.
3. Click **Allow** for the microphone and accessibility permissions.
4. In language settings, choose **Tagalog / Filipino** if listed and keep English. If
   Tagalog isn't listed, keep automatic detection.
5. Note the dictation shortcut it shows.

Test together: they come back to this chat, hold the shortcut, and say "Gusto kong
i-automate yung pag-reply sa customers ko." If it appears correctly, it works. If the
Tagalog comes out wrong, they can dictate in English; note it for a helper.

## Step 6: Done

Show a check or a cross for each:

- Homebrew (Mac) / Git (Windows)
- Kit files in `Documents/work-without-working-kit`
- Work folder `Documents/WORK FOLDER/<Business Name>` with CLAUDE.md
- FFmpeg
- Wispr Flow, signed in and tested
- Skills: Grill Me, grilling, stop-slop, dumbify

Then tell them:

> You're set up. Start a **new** Code session and choose your business folder
> (`WORK FOLDER/<Business Name>`). Type `/` to see your skills, or hold the Wispr Flow
> shortcut and just talk to me. When you want more tools, run Kit 02, the Skills Directory.
