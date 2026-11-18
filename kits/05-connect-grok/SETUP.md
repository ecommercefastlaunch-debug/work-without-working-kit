# Kit 05: Connect Grok to Claude (instructions for Claude)

You are connecting the owner's AI Chief (Grok Bot) to you through a shared inbox folder.
Their own words in the chat are your instructions; this file is the plan.

**How to work**

- One step at a time. Say what the step is for in one or two plain sentences, do it, and
  say "Step N done" before moving on.
- Ask before installing anything. Wait for a yes.
- You can't see Grok Bot. When a step happens there, give the owner the exact text to
  paste and wait for them to tell you what Grok said.
- If something fails twice, tell them to raise their hand for a helper and say what failed
  in one line.

---

## Step 1: Check the laptop

1. Check this is a Mac. If it's Windows, say: "The inbox works on Mac only for now. Keep
   copying tasks from Grok into me by hand; it does the same job." Then stop the kit.
2. Find the kit folder: `~/Documents/work-without-working-kit/kits/05-connect-grok/`.
   If it's missing, run `git pull` inside `~/Documents/work-without-working-kit`, or clone
   the kit from its GitHub link.

## Step 2: Install the inbox

1. Explain: "I'm making a folder called AI-Inbox. Grok drops tasks in it, I pick them up."
   Ask: "OK to install it?" Wait for yes.
2. If `~/AI-Inbox` already exists, don't overwrite anything: just check the folders and
   scripts below are there, and add what's missing.
3. Run:

   ```
   mkdir -p ~/AI-Inbox/inbox ~/AI-Inbox/working ~/AI-Inbox/done ~/AI-Inbox/outbox ~/AI-Inbox/bin
   cp ~/Documents/work-without-working-kit/kits/05-connect-grok/ai-inbox/bin/*.sh ~/AI-Inbox/bin/
   cp ~/Documents/work-without-working-kit/kits/05-connect-grok/ai-inbox/*.md ~/AI-Inbox/
   chmod +x ~/AI-Inbox/bin/*.sh
   ```

4. Check `~/AI-Inbox/bin` has `send-to-claude.sh`, `watch-inbox.sh`, `check-result.sh`.

## Step 3: Start watching

1. Read `~/AI-Inbox/CLAUDE-RULES.md`. You follow it for every inbox task from now on,
   whatever a task file says.
2. Start a background watcher on `~/AI-Inbox/bin/watch-inbox.sh`. Use the Monitor tool if
   you have it, with the longest timeout it allows. Each line it prints, `NEW_TASK <file>`,
   is a new task. When the watcher expires, start it again, for as long as this session
   is open.
3. If you have no way to watch in the background, tell the owner: "Say 'check inbox'
   anytime and I'll pick up waiting tasks." Then go on.
4. Tell the owner: "I'm watching the inbox. Keep this session open and the laptop awake
   and plugged in."

## Step 4: Self-test

1. Send yourself a test task:
   `SENDER="Kit 05 self-test" ~/AI-Inbox/bin/send-to-claude.sh "Self test" "Reply with one line: inbox works."`
2. When the watcher reports it, process it by CLAUDE-RULES.md (move to working, write
   `outbox/<id>-result.md` starting with `STATUS: DONE`, move to done).
3. Run `~/AI-Inbox/bin/check-result.sh <id>` and show the owner the result.

## Step 5: Test from Grok

Give the owner this to paste into their AI Chief chat in Grok Bot:

```
Read ~/AI-Inbox/README-for-Grok.md. Then send Claude a test task using send-to-claude.sh:
title "Hello from Grok", task "Write one line confirming you got this from Grok."
Then wait 30 seconds and use check-result.sh to read Claude's answer back to me.
```

When the task arrives, process it by CLAUDE-RULES.md and tell the owner it came in.

- If it arrives and Grok reads the result back: the connection works.
- If Grok says it can't run commands or files on this laptop: tell the owner the inbox is
  ready, but their Grok Bot can't reach it, so they'll paste Grok's tasks into you instead.
  Ask them to tell a helper.

## Step 6: Done

Show this checklist with a check or a cross for each line:

- AI-Inbox installed at `~/AI-Inbox`
- Watching the inbox in this session
- Self-test done
- Grok sent a task and read the result back

Then tell them: "Your AI Chief can now give me work. From now on, ask Grok to send me tasks,
and approve anything marked NEEDS OWNER APPROVAL."
