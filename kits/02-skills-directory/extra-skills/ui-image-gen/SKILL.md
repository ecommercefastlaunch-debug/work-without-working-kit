---
name: ui-image-gen
description: Generate images through the owner's own signed-in ChatGPT or Gemini (Nano Banana) account instead of paid APIs, then save the result in the project's Outputs folder. Use when the owner asks to make or edit an image "sa ChatGPT", "sa Gemini", "Nano Banana", "gamit account ko", or wants both compared. Not for Higgsfield credits or video.
---

# Image generation through the owner's ChatGPT / Gemini accounts

Uses the owner's own subscriptions. No API keys.

- **ChatGPT, through the terminal (preferred on Mac):** the Codex CLI that comes with the
  ChatGPT desktop app is signed in with the owner's ChatGPT account and can generate images.
- **Gemini / Nano Banana, through the browser pane** of the Claude desktop app.

## ChatGPT via the Codex CLI

```bash
CODEX=/Applications/ChatGPT.app/Contents/Resources/codex-cli/bin/codex
OUT="<WORK FOLDER>/<project>/Outputs/images"; mkdir -p "$OUT"; cd "$OUT"
"$CODEX" exec --skip-git-repo-check -s workspace-write \
  "Generate an image with your image generation tool: <prompt, incl. aspect ratio>. Save the image file in the current directory as <name>.png and print its path."
```

- Takes about 30 to 90 seconds.
- First check `"$CODEX" login status` says it's logged in with ChatGPT. If not, ask the
  owner to run `codex login` themselves. Never type their password.
- For a reference or edit image, put the file in `$OUT` and say "use ./ref.jpg as the reference".

## Gemini via the browser pane

1. Open gemini.google.com in the browser pane. If it asks to sign in, the owner signs in
   themselves. Never type passwords or codes.
2. Start a new chat for each new image idea.
3. Start the prompt with "Generate an image:" and state the aspect ratio ("4:5 vertical", "9:16").
4. Wait for it to finish, then use the "Download full size image" button.
5. Find the new file in `~/Downloads` and move it to `<WORK FOLDER>/<project>/Outputs/images/`.

## Saving

Name files `YYYY-MM-DD - <chatgpt|gemini> - <short title>.png`. Never overwrite; add `-v2`.
Show the owner the image and tell them where it's saved.

## Rules

- Each account has daily image limits. If one says the limit is reached, offer the other.
- Don't accept upgrade offers, change settings, or start purchases in either account.
- Don't copy other brands' logos or trademarks into the owner's images.
