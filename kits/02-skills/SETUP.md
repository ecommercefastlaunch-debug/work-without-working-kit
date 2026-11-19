# Kit 02: Skills (instructions for Claude)

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
tell them to run Kit 01 first, and stop.

## Step 2: Install the skills

Say: "I'm adding 60 Claude skills for your sales and marketing. About 2 to 5 minutes."

```
curl -fsSL https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/02-skills/install-skills.sh -o /tmp/wwk-skills.sh && bash /tmp/wwk-skills.sh
```

It prints one line per skill (`INSTALLED`, `ALREADY`, `FAILED`) and ends with
`Done: N installed, N already there, N failed.` On `FAILED`, run it once more; it skips what's
done. Still failing: helper.

## Step 3: Done

Read `~/.claude/skills` and show the result grouped by category (the categories are in
`kits/02-skills/skills.tsv`; you can read it from
`https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/02-skills/skills.tsv`).
For each category, one line with the count and the skill names, for example:

> **Sales (8):** sales-objections, sales-followup, negotiation, proposal-pricing, ...

Mark any that failed with a cross. Then suggest **3 to try first** based on their business in
`WORK FOLDER/CLAUDE.md` (for most owners: offer-builder, sales-objections, breakthrough-ads).

Then tell them:

> Your skills are ready. They work in **new** sessions: start a new Code session in your
> WORK FOLDER and type `/` to see them, or just ask, like "Use offer-builder on my
> product." A good first try: paste what you sell and ask for your offer.
