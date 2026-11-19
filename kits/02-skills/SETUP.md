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

Say: "I'm adding 12 Claude skills for your marketing. About 2 minutes."

```
curl -fsSL https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/02-skills/install-skills.sh -o /tmp/wwk-skills.sh && bash /tmp/wwk-skills.sh
```

It prints one line per skill (`INSTALLED`, `ALREADY`, `FAILED`) and ends with
`Done: N installed, N already there, N failed.` On `FAILED`, run it once more; it skips what's
done. Still failing: helper.

## Step 3: Done

Show a check or a cross for each, with one plain line on what it does:

| Skill | What it does |
|---|---|
| offer-builder | Market research, competitors and offer statements from what you sell |
| breakthrough-ads | 10 ad scripts per request, each from a different angle |
| copywriting | Offers, landing pages, headlines, product pages |
| product-marketing | Who it's for, why you, what to say first |
| customer-research | Turns customer messages and reviews into what they really want |
| social | Posts, carousels and content calendars |
| ad-creative | Ad headlines and copy variations |
| content-repurposing | One piece of content into many posts |
| hook-killers | Fixes weak opening lines |
| storytelling | Gives scripts and posts a story that holds attention |
| stop-slop | Keeps the writing from sounding like AI |
| dumbify | Keeps explanations and customer messages simple |

Then tell them:

> Your skills are ready. They work in **new** sessions: start a new Code session in your
> WORK FOLDER and type `/` to see them, or just ask, like "Use offer-builder on my
> product." A good first try: paste what you sell and ask for your offer.
