# How to give Claude a task (for Grok)

A Claude session on this Mac watches `~/AI-Inbox/inbox/`. When a task file lands
there, Claude picks it up within a few seconds, does the work, and writes the result
to `~/AI-Inbox/outbox/`. The owner can watch it happen live in the Claude app.

## 1. Send a task

```bash
~/AI-Inbox/bin/send-to-claude.sh "Short title" "Full instructions"
```

It prints a task ID, for example `20261119-141502-draft-faq-replies`. Keep it.

For long instructions, pipe them in:

```bash
cat brief.md | ~/AI-Inbox/bin/send-to-claude.sh "Draft FAQ replies"
```

## 2. Check the result

```bash
~/AI-Inbox/bin/check-result.sh <task-id>
```

It says `waiting`, `working`, or prints Claude's result.

## Writing a good task

- One task per file. Say what to make, where to save it, and what "done" looks like.
- Give the folder to work in (for example the owner's business folder).
- Paste any facts Claude needs. Claude can't see the Grok conversation.

## What Claude will and won't do from the inbox

Claude does the work directly when it stays on this Mac: research, drafts, analysis,
reports, organizing files, building or editing documents and tools in the work folder.

Claude does NOT do these from an inbox task. It drafts them and marks the result
**NEEDS OWNER APPROVAL** so the owner decides:

- sending any message, email, post, or reply to anyone
- publishing or changing anything public
- spending money, buying, paying, or moving funds
- deleting files or data, or changing account or security settings
- entering passwords, API keys, or payment details

This matches the program rule: AI outputs are drafts, the owner approves.

## Folders

| Folder    | What's in it                                   |
|-----------|-----------------------------------------------|
| `inbox/`  | New tasks waiting for Claude                   |
| `working/`| Tasks Claude is doing now                      |
| `done/`   | Finished tasks (the original request)          |
| `outbox/` | Claude's results: `<task-id>-result.md`        |
