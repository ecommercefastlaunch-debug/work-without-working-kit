# Kit 04: AI Workforce (instructions for Claude)

You are helping a business owner with no tech background hire and test their first AI
employees. Their AI Chief of Staff runs in Grok Bot; you build the employees here. Their
own words in the chat are your instructions; this file is the plan.

**How to work**

- One step at a time. Say what the step is for in one or two plain sentences, do it, and
  say "Step N done" before moving on.
- The owner decides who gets hired. Never invent facts about their business.
- Don't install anything. You only write files in their business folder.
- You can't see Grok Bot. When a step happens there, give the owner the exact text to
  paste, and wait for them to paste Grok's answer back.
- Hire 1 or 2 employees at most today.
- If something fails twice, tell them to raise their hand for a helper and say what failed
  in one line.

---

## Step 1: Read the business

Find the business folder (current folder if it has a CLAUDE.md, otherwise look in
`Documents/WORK FOLDER/` and ask). Read `CLAUDE.md`, `00 Bottleneck/bottleneck-brief.md`,
and `02 AI Team/org-plan.md`.

## Step 2: Ask the AI Chief who to hire

Give the owner this to paste into their AI Chief chat in Grok Bot:

```
Based on my bottleneck and org plan, which 1 or 2 AI employees should I hire first?
For each one, write a job description with:
- Role title
- 3 to 5 tasks it does
- What it needs from me to start (inputs, files)
- What good work looks like
- 2 or 3 quality checks before it hands work to me
Keep each one under 15 lines.
```

Then say: "Paste Grok's answer back here."

## Step 3: Pick who to hire

1. When they paste it, check each job description against the org plan and CLAUDE.md.
   Point out anything vague, invented, or that needs a login to another app (those come later).
2. Ask: "Which one or two do you want to hire?"
3. Give each a short name in lowercase with hyphens, e.g. `customer-reply-assistant`.
4. Save each job description to `02 AI Team/<role-name>.md`.

## Step 4: Build each AI employee

For each hire:

1. Create `.claude/skills/<role-name>/` in the business folder.
2. Copy `Documents/work-without-working-kit/kits/04-ai-workforce/templates/employee-SKILL.md`
   there as `SKILL.md` (fetch it from the kit's GitHub link if the kits folder is missing).
3. Fill in every `{{...}}` from the job description and CLAUDE.md. Write the `description`
   in the owner's words: it's how Claude knows when to call this employee.
4. Tell the owner in one line per employee: "Your <role title> does X when you give it Y."

## Step 5: First shift (Exercise 2)

For each employee:

1. Ask: "Give me one real task for your <role title>, something you'd normally do this week."
2. Do the task by following that employee's SKILL.md exactly, including its checks.
3. Save the result where the SKILL.md says, and show it.
4. Ask: "Pass or Fix? One line on why."

Create or update `02 AI Team/scorecard.md` with a row per task:
`| Date | Employee | Task | Pass/Fix | Owner's note |`

## Step 6: Fix once

If the owner said Fix, change the employee's SKILL.md to address the note (not just the
output), redo the same task, and ask Pass or Fix again. Record the second try on the
scorecard too. At most two tries today.

## Step 7: Done

1. Add each employee to `02 AI Team/my-tools.md`:
   `- /<role-name>: AI employee, <role title>, hired <today's date>`
2. Show this checklist with a check or a cross for each line:
   - 1 or 2 AI employees built in `.claude/skills/`
   - Job descriptions saved in `02 AI Team/`
   - At least one real task scored Pass on `02 AI Team/scorecard.md`
3. Tell them: "Your AI team is hired and tested. Tell your AI Chief in Grok who you hired:
   paste it the role names and what each one does." Give them that text ready to paste.
