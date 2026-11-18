# Kit 05: Connect Grok to Claude

**Day 1, block 13.** The AI Chief in Grok Bot sends tasks straight to Claude. No more
copy-paste: Grok drops a task in a shared inbox folder, Claude picks it up within seconds,
does it, and writes the result back where Grok can read it.

## Before this kit

Kits 01 to 04 are done. They're in a Code session with their business folder selected.

**Mac only for now.** On Windows, keep copying between Grok and Claude by hand.

**Grok Bot must be able to run commands on the laptop.** If it can't, the owner pastes
Grok's task into Claude instead. Same result, one extra step.

## The one prompt (owners paste this into Claude)

```
Run Kit 05 from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/05-connect-grok/SETUP.md (it's also in my Documents/work-without-working-kit folder) and follow it step by step with me.
```

## How it works

```
Grok Bot  --send-to-claude.sh-->  ~/AI-Inbox/inbox/  --Claude watches-->  Claude does the task
Grok Bot  <--check-result.sh---  ~/AI-Inbox/outbox/ <--Claude writes----  result + STATUS
```

Claude only does work that stays on the laptop. Anything that sends, posts, pays, or
deletes comes back as **NEEDS OWNER APPROVAL**.

## They leave with

- [ ] `~/AI-Inbox` installed
- [ ] This Claude session watching the inbox
- [ ] A test task sent by Grok, done by Claude, and read back by Grok

## Takes about

20 to 30 minutes.

## Important

The watcher runs inside the open Claude session. Keep the laptop awake, plugged in, and
the session open. If the session closes, tasks wait in the inbox until a session watches again.
