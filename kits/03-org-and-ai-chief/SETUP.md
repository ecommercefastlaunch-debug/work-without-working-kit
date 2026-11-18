# Kit 03: Org and AI Chief (instructions for Claude)

You are helping a business owner with no tech background map their organization and
prepare their AI Chief of Staff, which runs in Grok Bot. Their own words in the chat are
your instructions; this file is the plan.

**How to work**

- One step at a time. Say what the step is for in one or two plain sentences, do it, and
  say "Step N done" before moving on.
- You suggest, the owner decides. Never invent facts about their business.
- Don't install anything in this kit. You only write files in their business folder.
- You can't see or control Grok Bot. When a step happens in Grok, tell the owner exactly
  what to paste and wait for them to paste Grok's answer back.
- If something fails twice, tell them to raise their hand for a helper and say what failed
  in one line.

---

## Step 1: Read the business

Find the business folder (the current folder if it has a CLAUDE.md, otherwise look in
`Documents/WORK FOLDER/` and ask). Read `CLAUDE.md`, `00 Bottleneck/bottleneck-brief.md`,
and `02 AI Team/my-tools.md` if it exists.

## Step 2: Map the work

1. Ask: "Who works in your business today? Name and role, or just the roles." Wait.
2. From that and the files, list every recurring job you can find. Group them under:
   Sales, Marketing, Customer Service, Operations, Finance, and Admin (skip empty groups).
3. For each job, show: what it is, who does it now, how often, and your suggestion:
   - **People:** needs a human (relationships, judgment, physical work)
   - **System:** a tool or app should do it (payments, booking, inventory)
   - **AI:** an AI employee can draft or do it, with the owner approving
4. Mark the jobs that are part of the bottleneck with ⭐.
5. Ask the owner to correct it: "What's wrong or missing? Which ones would you never give
   to AI?" Update the map with their answers.

## Step 3: Save the org plan

Save it as `02 AI Team/org-plan.md`: a table with Job, Group, Who now, How often,
People / System / AI, and ⭐ for the bottleneck. Under the table, one line: "AI jobs to
hire for first:" with the ⭐ jobs marked AI.

## Step 4: Write the AI Chief hiring brief

1. Copy `Documents/work-without-working-kit/kits/03-org-and-ai-chief/templates/ai-chief-brief.md`
   to `02 AI Team/ai-chief-brief.md`. (If the kits folder is missing, fetch it from the kit's
   GitHub link.)
2. Fill in `{{BUSINESS_NAME}}` and paste the full text of `CLAUDE.md`,
   `bottleneck-brief.md`, and `org-plan.md` into their sections.
3. Show it to the owner in one sentence: "This is everything your AI Chief needs to know."

## Step 5: Hire the AI Chief in Grok Bot

Tell the owner:

1. "Open Grok Bot and start a new chat."
2. "Open `02 AI Team/ai-chief-brief.md`, copy everything, and paste it into Grok Bot."
   Offer to show the full text in the chat so they can copy it from here.
3. "Paste Grok's reply back here."

## Step 6: Check the AI Chief understood

When they paste Grok's reply, compare it to the files:

- Did it describe the business correctly?
- Did it name the right bottleneck?
- Are its 3 first tasks AI jobs from the org plan?
- Did it invent anything (prices, promises, numbers)?

Tell the owner what's right and what's off, in plain words. If something's off, write the
exact correction for them to paste into Grok, and check its next reply the same way.

## Step 7: Done

Show this checklist with a check or a cross for each line:

- Org plan saved: `02 AI Team/org-plan.md`
- AI Chief brief saved: `02 AI Team/ai-chief-brief.md`
- AI Chief hired in Grok Bot and explained the bottleneck correctly

Then tell them: "Your AI Chief is hired. Keep that Grok chat open. Next, Kit 04 hires your
first AI employees."
