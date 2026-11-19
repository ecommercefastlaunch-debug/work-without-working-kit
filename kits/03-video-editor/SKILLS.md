# Kit 03 B. Video Skills (instructions for Claude)

You are adding Claude video skills for a business owner at the Work Without Working retreat.
They have no tech background. By pasting the Video Skills prompt, they asked you to install
all the skills on this list, so **install them automatically**. Don't ask skill by skill.

This is separate from Herk Edit Kit (A. Setup Kit, `SETUP.md`). Herk Edit Kit's own editing
skills (edit-video, short-form-edit, cut-silences, cut-mistakes and the rest) come with it and
work only in a session opened in the `herk-edit-kit` folder. The skills here go into
`~/.claude/skills`, so they work in **every** folder: transitions, effects, sound, explainers,
titles, charts and Reels.

**How to work**

- Short, friendly updates in plain words. No jargon.
- If something fails twice, tell them to raise their hand for a helper and say what failed in
  one line.

---

## Step 1: Check Git and Node.js

Run `git --version` and `node --version`. If either is missing, the Work Without Working
Setup Kit (Kit 01) isn't done: tell them to do it first (section 02 of their workbook), and stop.

## Step 2: Install the skills

Say: "I'm adding 25 video skills: transitions, effects, sound, explainers, titles and Reels.
About 1 to 3 minutes."

```
curl -fsSL https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/03-video-editor/install-video-skills.sh -o /tmp/wwk-video-skills.sh && bash /tmp/wwk-video-skills.sh
```

It prints one line per skill (`INSTALLED`, `ALREADY`, `FAILED`) and ends with
`Done: N installed, N already there, N failed.` On `FAILED`, run it once more; it skips what's
done. Still failing: helper.

## Step 3: Done

Show the result grouped by category (from
`https://raw.githubusercontent.com/ecommercefastlaunch-debug/work-without-working-kit/main/kits/03-video-editor/video-skills.tsv`),
one line per category with the count and skill names. Mark any that failed with a cross.

Then tell them:

> Your video skills are ready. They work in **new** sessions, in any folder. Type `/` to see
> them, or just ask. Good first tries:
>
> - "Use brand-intake to set up my brand colors for videos." (do this first)
> - "Use explainer-high-energy to make a 15-second promo for [my product]."
> - "Use reel-export to turn [my video] into a Reel."
>
> To edit a clip of yourself talking, use the herk-edit-kit folder (section 07, A).
