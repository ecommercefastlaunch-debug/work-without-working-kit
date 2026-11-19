# Kit 03: My 24/7 AI Video Editor (instructions for Claude)

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

Say: "I'm setting up your 24/7 AI video editor. About 10 to 20 minutes."

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
3. `npx hyperframes browser ensure` (downloads the browser the editor uses to render video)
4. `npm test`

If `npm test` fails, run `npx hyperframes doctor` and show the helper the lines marked fail.

## Step 4: Render the demo video

Inside `herk-edit-kit`:

1. `npm run demo`
2. In `video-projects/demo`: `npx hyperframes lint`, then
   `npx hyperframes render --quality draft --output renders/demo.mp4`
3. Open the video for them (Mac: `open`, Windows: `start ""`). Done when they've seen it play.

## Step 5: Transcription key (optional, the owner does this)

Say: "To edit your videos by what you say, the kit sends the audio to a service called
ElevenLabs. That needs your own key from your own ElevenLabs account. You paste it; I never
see it."

- **They have a key:** open the settings file for them (Mac: `open -e .env`; Windows:
  `notepad .env`, both inside `herk-edit-kit`). Tell them: find `ELEVENLABS_API_KEY=`, paste
  the key right after the `=`, save, close. Wait until they say it's done.
- **No key yet:** say they can sign up at elevenlabs.io later and add it the same way.
  Everything else works now; editing their own talking clips needs the key (or ask the
  editor to use Whisper instead).

## Step 6: Done

Show this list with a ✓ or ✗ for each line:

- Node.js, Git, FFmpeg ready
- Herk Edit Kit installed, test passed
- Demo video rendered and played
- ElevenLabs key added (or "later")

Then tell them:

> Your 24/7 AI video editor is ready. To use it, start a **new** Code session and choose
> the **herk-edit-kit** folder in Documents (the video skills only work there). Then paste:
>
> "Use short-form-edit to turn my clip at [where my clip is] into a 30 to 60 second Reel,
> with a strong hook, captions and B-roll. Show me the cuts before you render."
>
> When you approve the video, ask Claude to copy it to your project's Outputs folder in
> your WORK FOLDER.
