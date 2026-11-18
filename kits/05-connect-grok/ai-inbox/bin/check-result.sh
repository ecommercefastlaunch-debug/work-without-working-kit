#!/bin/bash
# For Grok: check the status of a task and print Claude's result when it's ready.
# Usage: check-result.sh <task-id>
BOX="$HOME/AI-Inbox"
id="${1:-}"
[ -n "$id" ] || { echo "Usage: check-result.sh <task-id>" >&2; exit 1; }

if [ -f "$BOX/outbox/$id-result.md" ]; then
  cat "$BOX/outbox/$id-result.md"
elif [ -f "$BOX/working/$id.md" ]; then
  echo "STATUS: working (Claude picked it up and is on it)"
elif [ -f "$BOX/inbox/$id.md" ]; then
  echo "STATUS: waiting (not picked up yet; is the Claude session open and watching?)"
else
  echo "STATUS: unknown task id: $id"
fi
