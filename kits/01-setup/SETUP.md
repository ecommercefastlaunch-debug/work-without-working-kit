# Kit 01: Setup (instructions for Claude)

You are setting up a business owner at the Work Without Working retreat. They have no
tech background. Their own words in the chat are your instructions; this file is the plan.

**How to work**

- One step at a time. Before each step, say in one or two plain sentences what it does
  and why. After it, check it worked, then say "Step N done" before moving on.
- Ask before installing anything. Wait for a yes.
- Never type passwords, never create accounts, never enter payment details. The owner
  does those. If a step needs one, tell them exactly where to click and wait.
- If something fails twice, stop and tell them to raise their hand for a helper.
  Say what failed in one line so the helper can see it.
- Keep replies short. No jargon. If you must use a tech word, explain it in a few words.

---

## Step 1: Check the computer and Git

Git is the tool that downloads kits and skills from GitHub.

1. Find out if this is a Mac or Windows laptop.
2. Run `git --version`.
3. If it prints a version, Step 1 is done.
4. If Git is missing:
   - **Mac:** ask, then run `xcode-select --install`. Tell them: "A window will pop up.
     Click **Install**, then **Agree**. It takes a few minutes." When they say it
     finished, run `git --version` again.
   - **Windows:** tell them to download Git for Windows from
     https://git-scm.com/download/win, run the installer, and click **Next** on every
     screen to keep the default options. Then close and reopen the Claude app, start a
     new Code session, and paste the kit prompt again. You'll pick up from Step 1.

## Step 2: GitHub, in one minute

Tell them, in your own words:

- GitHub is where the kits and skills live online.
- They do **not** need a GitHub account to use the kits today.
- If they want one later to save their own work, they can sign up at
  https://github.com/signup themselves.

Don't create an account or ask for their GitHub login. Move on.

## Step 3: Download the kits

1. Find their Documents folder (`~/Documents` on Mac, `%USERPROFILE%\Documents` on Windows).
2. If `work-without-working-kit` is already there, run `git pull` inside it.
   Otherwise run, inside Documents:
   `git clone https://github.com/ecommercefastlaunch-debug/work-without-working-kit.git work-without-working-kit`
3. Check that `work-without-working-kit/kits/01-setup/SETUP.md` exists.

## Step 4: Build the work folder

1. Ask: "What's the name of your business?" Use the exact name they give.
2. Create this inside their Documents folder (skip any folder that already exists,
   and never delete or overwrite anything):

   ```
   WORK FOLDER/
     <Business Name>/
       00 Bottleneck/
       01 Business Info/
       02 AI Team/
       03 Outputs/
       04 Inbox/
   ```

3. Copy `work-without-working-kit/kits/01-setup/templates/CLAUDE.md` into
   `WORK FOLDER/<Business Name>/CLAUDE.md`. If a CLAUDE.md is already there, ask
   before changing it.
4. Fill it in by asking these, **one at a time**, waiting for each answer:
   1. What do you sell? (main products or services)
   2. Who buys from you? (describe your best customer)
   3. What are your prices? (rough is fine)
   4. How do you talk to customers? (formal, friendly, Taglish, English...)
5. Replace each `{{...}}` with their answer in their own words, tidied up but not
   made fancier. Leave "My bottleneck" as it is; Grill Me fills it later.
6. Show them the finished CLAUDE.md and ask if anything is wrong. Fix what they say.

## Step 5: Install the starter skills

Skills are job training for Claude: once installed, Claude knows how to do that job
well every time. Explain each one in a line, then ask: "Can I install these now?"
Wait for yes.

| Skill | What it does for them | From (MIT License) |
|---|---|---|
| Grill Me + grilling | Interviews them with hard questions until a plan is clear | mattpocock/skills |
| stop-slop | Makes everything Claude writes stop sounding like AI | hardikpandya/stop-slop |
| dumbify | Keeps explanations and customer messages simple | artemnovitckii/content-skills |
| copywriting | Writes offers, pages and headlines | coreyhaines31/marketingskills |
| copy-editing | Tightens and proofreads their own text | coreyhaines31/marketingskills |
| customer-research | Turns customer messages and reviews into what customers want | coreyhaines31/marketingskills |

Run the kit's installer (on Windows, run it in Git Bash):

```
bash ~/Documents/work-without-working-kit/kits/01-setup/install-skills.sh
```

It downloads each skill from its original GitHub repo into `~/.claude/skills`, skips any
that are already there, and ends with a line like `Done: 7 installed, 0 already there,
0 failed.` Show them that line. If anything says FAILED, run it once more; if it fails
again, tell them to raise their hand.

## Step 6: Install the Small Business plugin

The Small Business plugin is made by Anthropic: 44 skills for running a small business
(cash flow, invoices, proposals, customer replies, reviews, hiring, social content, and
more). It works without connecting any apps, and it always pauses before anything is
sent, posted, or paid.

1. Ask: "Can I install the Small Business plugin from Anthropic?" Wait for yes.
2. Run:

   ```
   bash ~/Documents/work-without-working-kit/kits/01-setup/install-plugin.sh
   ```

3. It ends with `INSTALLED`, `ALREADY`, or `FAILED`. If FAILED, tell them to raise their
   hand and go on; the rest of the day works without it.
4. Tell them: "Don't connect any apps to it today. We'll keep everything on your laptop."

## Step 7: Done checklist

Show this, with a check or a cross for each line:

- Git works
- Kits downloaded to `Documents/work-without-working-kit`
- Work folder created: `Documents/WORK FOLDER/<Business Name>`
- CLAUDE.md written about their business
- Starter skills installed (Grill Me, stop-slop, dumbify, copywriting, copy-editing, customer-research)
- Small Business plugin installed

Then tell them:

> You're set up. Start a **new** Code session, choose your business folder
> (`WORK FOLDER/<Business Name>`) as the folder, and wait for the next instruction.
> Your new skills show up when you type `/` in that new session. Try `/grill-me`.
