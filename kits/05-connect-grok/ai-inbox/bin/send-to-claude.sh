#!/bin/bash
# Send a task from Grok (or anyone) to the Claude session watching ~/AI-Inbox.
#
# Usage:
#   send-to-claude.sh "Short title" "Full instructions for Claude"
#   echo "Full instructions" | send-to-claude.sh "Short title"
#
# Prints the task ID. Claude's result appears in ~/AI-Inbox/outbox/<task-id>-result.md
set -euo pipefail

BOX="$HOME/AI-Inbox"
title="${1:-}"
if [ -z "$title" ]; then
  echo "Usage: send-to-claude.sh \"Short title\" \"Instructions\"" >&2
  exit 1
fi
if [ $# -ge 2 ]; then body="$2"; else body="$(cat)"; fi
if [ -z "$body" ]; then
  echo "No instructions given." >&2
  exit 1
fi

slug=$(printf '%s' "$title" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//' | cut -c1-40)
id="$(date +%Y%m%d-%H%M%S)-${slug:-task}"
tmp="$BOX/.tmp-$id.md"

cat > "$tmp" <<EOF
---
id: $id
from: ${SENDER:-Grok}
sent: $(date '+%Y-%m-%d %H:%M:%S')
title: $title
---

$body
EOF

# Move into the inbox in one step so Claude never reads a half-written file.
mv "$tmp" "$BOX/inbox/$id.md"
echo "$id"
