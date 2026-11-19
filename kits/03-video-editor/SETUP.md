# Kit 03 A. Setup Kit: My 24/7 AI Video Editor (instructions for Claude)

You are installing Nate Herk's free video-editing kit, **Herk Edit Kit**
(https://github.com/nateherkai/herk-edit-kit, MIT license), for a business owner at the
Work Without Working retreat. They have no tech background. By pasting the Kit 03 prompt,
they asked you to install it, so **install it automatically**. Don't ask step by step.

**How to work**

- Short, friendly updates in plain words. No jargon.
- Never type passwords or API keys. If a step needs one, show the owner exactly where to
  paste it and wait until they say it's done.
- Installs can be slow on venue Wi-Fi. Say when something takes a few minutes.
- If something fails twice, tell them to raise their hand for a helper and say what failed
  in one line. Don't change the kit's own files.

---

## Step 1: Check the tools

Say: "I'm setting up your 24/7 AI video editor: Herk Edit Kit and the video engine. About 10 to 15 minutes."

This kit installs only those two. The video skills are a separate install (`SKILLS.md`).

Check, and report found or missing in one line:

- `node --version` (needs 22 or newer)
- `git --version`
- `ffmpeg -version` and `ffprobe -version`

If any is missing, the Work Without Working Setup Kit (Kit 01) isn't done. Install just
the missing ones:

- **Mac:** `brew install node ffmpeg git` (only the missing ones). If `brew` is missing,
  tell them to do the Setup Kit first (section 02 of the workbook) and stop.
- **Windows:** `winget install --id OpenJS.NodeJS.LTS -e`, `winget install --id Gyan.FFmpeg -e`,
  `winget install --id Git.Git -e` (add `--accept-source-agreements --accept-package-agreements`).
  Then they close and reopen the Claude app, paste the Kit 03 prompt again, and you start
  from Step 1.

## Step 2: Download the kit

In their Documents folder:

- If `Documents/herk-edit-kit` exists: `git pull` inside it.
- Otherwise: `git clone https://github.com/nateherkai/herk-edit-kit.git` into Documents.

## Step 3: Install it

Inside `Documents/herk-edit-kit`, run in order (say each takes a minute or more):

1. `npm ci`
2. `npm run setup` (checks the tools and creates the `.env` settings file)
3. `npx hyperframes browser ensure` (the video engine: downloads the browser it renders with)
4. `npm test`

If `npm test` fails, run `npx hyperframes doctor` and show the helper the lines marked fail.

## Step 4: Done

Show this list with a ✓ or ✗ for each line:

- Herk Edit Kit installed in Documents/herk-edit-kit
- Video engine ready (test passed)

Then tell them:

> Your video editor is installed. Next, add your video skills (B. Skills in section 07 of
> your workbook). To edit a video, start a **new** Code session and choose the
> **herk-edit-kit** folder in Documents.
>
> To edit a clip of yourself talking, the editor needs your own ElevenLabs key to read what
> you say. Ask Claude to open the herk-edit-kit `.env` file, and paste the key after
> `ELEVENLABS_API_KEY=` yourself. Claude never types or sees it.
