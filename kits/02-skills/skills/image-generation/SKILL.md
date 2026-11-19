---
name: image-generation
description: Make or edit images with the owner's own ChatGPT account through Codex (the ChatGPT image model, no API key, no extra cost beyond their plan), and save them in the project's Outputs folder. Use when the owner asks for an image, product photo, poster, ad graphic, thumbnail, social post image, logo idea, or to edit a photo ("gawan mo ako ng image", "product photo", "poster", "i-edit mo itong picture"). Falls back to Gemini (Nano Banana) in the browser pane. Codex can't make videos yet, so this is for still images only.
---

# Image generation with the owner's ChatGPT account

Codex is OpenAI's coding agent. When it's signed in with the owner's ChatGPT account, it can
generate images with ChatGPT's image model. Claude writes the prompt, Codex makes the
picture, and Claude saves it in the right folder. No API key and no extra bill: it uses the
owner's ChatGPT plan and its daily limits.

## 1. Find Codex

Use the first that works:

- **Mac, ChatGPT desktop app:** `/Applications/ChatGPT.app/Contents/Resources/codex-cli/bin/codex`
- **Anywhere:** `codex` on the PATH (`command -v codex`)
- **Not installed:** ask "Can I install Codex, OpenAI's free tool that lets me use your
  ChatGPT for images?" On yes: `npm install -g @openai/codex` (Node.js comes from the Setup
  Kit). Windows: then close and reopen the Claude app if `codex` isn't found.

Call it `$CODEX` below.

## 2. Check it's signed in, and images are on

- `"$CODEX" login status` should say **Logged in using ChatGPT**.
- If not, open a window where the owner signs in themselves:
  - Mac: `osascript -e 'tell application "Terminal" to activate' -e 'tell application "Terminal" to do script "codex login"'`
    (use the full `$CODEX` path in the script if `codex` isn't on the PATH)
  - Windows: `start powershell -NoExit -Command "codex login"`

  Tell them: "A browser page opens. Sign in with your ChatGPT account and click Continue.
  Then come back here." Never type their email, password or codes.
- `"$CODEX" features list | grep image_generation` should say `true`. If it says `false`,
  run `"$CODEX" features enable image_generation`.

## 3. Make the image

1. Pick the project: the session's project folder, or ask which one. Save to
   `WORK FOLDER/<project>/Outputs/images/` (create it).
2. Write a clear prompt: the subject, the style, the setting, the text that must appear
   (spelled exactly), the brand colors if known, and the **aspect ratio** (1:1 feed post,
   4:5 Facebook/Instagram, 9:16 Reels/TikTok/Stories, 16:9 YouTube thumbnail).
3. Run it from the images folder:

   ```bash
   cd "<WORK FOLDER>/<project>/Outputs/images"
   "$CODEX" exec --skip-git-repo-check -s workspace-write \
     "Generate an image with your image generation tool: <prompt, with aspect ratio>. Save the image file in the current directory as <name>.png and print its path."
   ```

   It takes about 30 to 90 seconds. For several images, run them one after another (or in
   the background) and tell the owner how many are coming.
4. **Editing a photo or using a reference** (their product, their face, their logo): put the
   file in the images folder first, then say "Use ./<file> as the reference" in the prompt.
5. If the file didn't land in the folder, Codex also keeps every image in
   `~/.codex/generated_images/`; copy the newest one over.

## 4. Save and show

- Name: `YYYY-MM-DD - <short title>.png`. Never overwrite; add `-v2`, `-v3`.
- Show the owner the image and the path. Ask: "Okay na, or one change?" For a change, run it
  again with the fix in the prompt and save as the next version.

## Fallback: Gemini (Nano Banana) in the browser pane

If Codex isn't available or hit its limit, use gemini.google.com in the Claude app's browser
pane. The owner signs in themselves. Start the prompt with "Generate an image:", state the
aspect ratio, then use **Download full size image** and move the file from `~/Downloads` to
the project's `Outputs/images/` folder. Gemini is often better for realistic people and photo
edits; ChatGPT is better for text inside the image.

## Rules

- Each account has daily image limits. If one says the limit is reached, say so and offer
  the other.
- Don't accept upgrade offers, change account settings, or start purchases.
- No other brands' logos or trademarks, no real people's faces without their permission,
  and no fake "customer" photos presented as real.
- **Video:** Codex can't generate videos yet. If the owner asks for a video, say so plainly.
