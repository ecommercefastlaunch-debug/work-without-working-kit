# Kit 03: 24/7 Video Editor (instructions for Claude)

You are installing Nate Herk's video-editing kit for a business owner with no tech
background, then editing their first real clip with them. Their own words in the chat are
your instructions; this file is the plan.

**How to work**

- One step at a time. Say what the step is for in one or two plain sentences, do it, and
  say "Step N done" before moving on.
- Ask before installing anything. Wait for a yes.
- Never type passwords or API keys. If a step needs one, show the owner exactly where to
  paste it and wait until they say it's done.
- Installs can be slow on venue Wi-Fi. Tell them when something will take a few minutes.
- If something fails twice, tell them to raise their hand for a helper and say what failed
  in one line. Don't keep retrying.

---

## Step 1: Check the tools

Run and report each in plain words (found / missing):

- `node --version` (needs 22 or newer)
- `git --version`
- `ffmpeg -version` and `ffprobe -version`
- Google Chrome installed (Mac: `/Applications/Google Chrome.app`; Windows: check Program Files)

If everything is there, skip to Step 3.

## Step 2: Install what's missing

Ask before each install.

**Mac**

- If `brew --version` works: `brew install node ffmpeg` for whichever is missing.
- If Homebrew is missing, Kit 01 (Setup) wasn't finished: tell them to run Kit 01 first.
  Kit 01 already installs FFmpeg, so usually only Node.js is left.

**Windows**

- Node.js: `winget install OpenJS.NodeJS.LTS`
- FFmpeg: `winget install Gyan.FFmpeg`
- After installing, they must close and reopen the Claude app so the new tools are found.
  Then they paste the kit prompt again, and you pick up from Step 1.

**Chrome (both):** if missing, they download it themselves from https://www.google.com/chrome.

Re-run the Step 1 checks. Everything found means Step 2 is done.

## Step 3: Download and set up the kit

Inside their Documents folder:

1. If `herk-edit-kit` already exists, run `git pull` in it. Otherwise:
   `git clone https://github.com/nateherkai/herk-edit-kit.git`
2. Inside `herk-edit-kit`, run in order, and tell them each takes a minute or more:
   - `npm ci`
   - `npm run setup`
   - `npm test`
3. If `npm test` fails, show the last few lines to a helper. Don't change the kit's files.

## Step 4: Transcription key

1. Explain: "To edit your clip by what you say, the kit sends the audio to a service
   called ElevenLabs. That needs your own key from your own account."
2. Ask if they have an ElevenLabs account and key.
   - **Yes:** tell them to open `Documents/herk-edit-kit/.env` in a text editor, find
     `ELEVENLABS_API_KEY=`, paste their key right after the `=`, and save. You don't see
     or type the key. Wait for them to say it's done.
   - **No:** say they can still render the demo today and add a key later. Exercise 3 then
     becomes watching the facilitator's demo.

## Step 5: Render the demo

Inside `herk-edit-kit`:

1. `npm run demo`
2. `cd video-projects/demo`
3. `npx hyperframes lint`
4. `npx hyperframes render --quality draft --output renders/demo.mp4`
5. Tell them where the file is and ask them to play it. Done when they've seen it play.

## Step 6: Edit one real video (needs the key from Step 4)

1. Ask for the path to their raw clip. Copy it into
   `Documents/herk-edit-kit/video-projects/my-first-edit/raw/` (create the folders).
2. Tell them: "Open a new Code session with the `herk-edit-kit` folder selected. That's
   where the video skills live. Paste this there (I filled in your clip):"

   ```
   Use edit-video to edit my recording at <full path to the raw clip>.
   Keep my main points. Tighten dead air, show me the proposed mistake cuts,
   add captions, and produce a reviewed draft. Save it in the project's renders folder.
   ```

   Fill in the real path before you show it to them.

3. The owner watches the edit happen in that session, approves or skips the proposed cuts,
   then plays the draft and says Approve or one fix.

## Step 7: Done

Show this checklist with a check or a cross for each line:

- Node.js, Git, FFmpeg, Chrome ready
- Herk Edit Kit installed, `npm test` passed
- Demo rendered and played
- ElevenLabs key added by the owner
- One real clip edited, draft approved or one fix noted

Then tell them: "That's your 24/7 video editor. Any time you have a new recording, open a
session in the herk-edit-kit folder, give it the clip, and you only review the draft."
