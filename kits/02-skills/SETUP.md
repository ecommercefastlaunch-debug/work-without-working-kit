# Kit 02: Sales and Marketing Skills (instructions for Claude)

You are adding Claude skills for a business owner at the Work Without Working retreat. They
have no tech background. By pasting the Kit 02 prompt, they asked you to install all the
skills on this list, so **install them automatically**. Don't ask skill by skill.

Skills are add-ons that teach Claude a way of doing a job (offers, ads, posts, copy). Each one
is a folder with a `SKILL.md`, installed into `~/.claude/skills`, so it works in every project.

**How to work**

- Short, friendly updates in plain words. No jargon.
- If something fails twice, tell them to raise their hand for a helper and say what failed in
  one line.

---

## Step 1: Check Git

Run `git --version`. If it's missing, the Work Without Working Setup Kit (Kit 01) isn't done:
tell them to do the Work Without Working Setup Kit first (section 02 of their workbook), and stop.

## Step 2: Install the skills

Say: "I'm adding 61 Claude skills for your sales and marketing, including image making with your ChatGPT. About 2 to 5 minutes."

```
curl -fsSL https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/02-skills/install-skills.sh -o /tmp/wwk-skills.sh && bash /tmp/wwk-skills.sh
```

It prints one line per skill (`INSTALLED`, `ALREADY`, `FAILED`) and ends with
`Done: N installed, N already there, N failed.` On `FAILED`, run it once more; it skips what's
done. Still failing: helper.

## Step 3: Connect ChatGPT for images (Codex)

The `image-generation` skill makes images with the owner's own ChatGPT account through Codex,
OpenAI's tool. Say: "Next I'll connect your ChatGPT so I can make images for you."

1. Find Codex: on a Mac, `/Applications/ChatGPT.app/Contents/Resources/codex-cli/bin/codex`
   (comes with the ChatGPT desktop app); otherwise `command -v codex`. If neither exists,
   install it: `npm install -g @openai/codex` (Windows: close and reopen the Claude app if
   it isn't found after).
2. `<codex> login status`. If it doesn't say **Logged in using ChatGPT**, open a window
   where they sign in themselves:
   - Mac: `osascript -e 'tell application "Terminal" to activate' -e 'tell application "Terminal" to do script "<codex> login"'`
   - Windows: `start powershell -NoExit -Command "codex login"`

   Tell them: "A browser page opens. Sign in with your ChatGPT account and click Continue,
   then come back here." Never type their email, password or codes. Check `login status`
   again after.
3. `<codex> features list | grep image_generation` should say `true`; if `false`, run
   `<codex> features enable image_generation`.
4. If they don't have a ChatGPT plan or would rather skip, say images can still be made with
   Gemini in the browser pane, and move on.

Codex can't make videos yet; don't promise video.

## Step 4: Done

Read `~/.claude/skills` and show the result grouped by category (the categories are in
`kits/02-skills/skills.tsv`; you can read it from
`https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/02-skills/skills.tsv`).
For each category, one line with the count and the skill names, for example:

> **Sales (8):** sales-objections, sales-followup, negotiation, proposal-pricing, ...

Mark any that failed with a cross. Then suggest **3 to try first** based on their business in
`WORK FOLDER/CLAUDE.md` (for most owners: offer-builder, sales-objections, image-generation).

Then tell them:

> Your skills are ready. They work in **new** sessions: start a new Code session in your
> WORK FOLDER and type `/` to see them, or just ask, like "Use offer-builder on my
> product." A good first try: paste what you sell and ask for your offer.
