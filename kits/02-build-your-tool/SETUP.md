# Kit 02: Build Your Own Tool (instructions for Claude)

You are helping a business owner with no tech background build their first skill: a
reusable tool that does one repetitive task. Their own words in the chat are your
instructions; this file is the plan.

**How to work**

- One step at a time. Say what the step is for in one or two plain sentences, do it, and
  say "Step N done" before moving on.
- The owner makes the choices. You suggest, they decide.
- Keep the tool small: one task, done well. Aim to finish in about 30 minutes.
- Don't install anything in this kit. You only write files in their business folder.
- Today's tool works on text and files on this laptop only. If they pick a task that needs
  logging in to another app (Facebook, Shopee, a bank, email), say it comes later and
  help them pick a version that drafts the work instead.
- If something fails twice, tell them to raise their hand for a helper and say what failed
  in one line.

---

## Step 1: Read the business

1. Find the business folder: the current folder if it has a CLAUDE.md, otherwise look in
   `Documents/WORK FOLDER/` and ask which business.
2. Read `CLAUDE.md` and `00 Bottleneck/bottleneck-brief.md`.
3. If there's no bottleneck brief, ask: "In one sentence, what task eats most of your time
   every week?"

## Step 2: Pick one task

1. From the brief, suggest **3 repetitive tasks** that a tool could draft for them. For
   each: one line on what it does, and roughly how much time it saves per week if they
   said so. Never invent numbers they didn't give.
2. Ask them to pick one, or name their own.
3. Give the tool a short name in lowercase with hyphens, for example `reply-drafts` or
   `daily-sales-summary`. Ask if the name is OK.

## Step 3: Get one real example

Ask these, **one at a time**:

1. "Paste one real example of what you'd give this tool." (a customer message, a list of
   orders, a product name...)
2. "What would a great result look like for that example? Paste one you or your staff
   wrote, or describe it."
3. "Anything it must never do or say?"

If they don't have an example handy, help them write a realistic one together, and say
it's a practice example.

## Step 4: Write the skill

1. Create `.claude/skills/<skill-name>/` inside the business folder.
2. Copy the template from `Documents/work-without-working-kit/kits/02-build-your-tool/templates/SKILL.md`
   into that folder as `SKILL.md`. (If the kits folder is missing, fetch the template from
   the kit's GitHub link instead.)
3. Fill in every `{{...}}` from Steps 1 to 3. The `description` matters most: it's how
   Claude knows when to use the tool, so write it in the owner's own words.
4. Keep it short: under one page.
5. Show them the finished skill in plain words: "Your tool does X. You give it Y. It
   gives you Z." Ask if that's right. Fix what they say.

## Step 5: Test it on the real example

1. Follow the SKILL.md you just wrote, exactly as written, on the example from Step 3.
2. Save the result to `03 Outputs/<skill-name>-<today's date>.md` and show it.
3. Ask: "Is this good enough to use? What would you change?"

## Step 6: Improve it once

If they want changes, update the SKILL.md (not just the output), run it again on the same
example, and show the new result. Do this at most twice; more polishing can wait.

## Step 7: Record it and finish

1. Add a line to `02 AI Team/my-tools.md` (create it if missing):
   `- /<skill-name>: <what it does>, made <today's date>`
2. Show this checklist with a check or a cross for each line:
   - Tool written at `.claude/skills/<skill-name>/SKILL.md`
   - Tested on a real example, result in `03 Outputs`
   - Listed in `02 AI Team/my-tools.md`
3. Tell them:

> Your tool is ready. Next time, open a Code session in your business folder and type
> `/<skill-name>`, then paste what you want it to work on. If it doesn't show up when you
> type `/`, start a new session in your business folder.
