#!/bin/bash
# Used by the Claude session: prints one line per new task file in ~/AI-Inbox/inbox.
# Each printed line wakes the Claude session through its Monitor tool.
BOX="$HOME/AI-Inbox/inbox"
seen=""
# Announce tasks already waiting when the watcher starts.
while true; do
  for f in "$BOX"/*.md; do
    [ -e "$f" ] || continue
    name=$(basename "$f")
    case " $seen " in *" $name "*) continue ;; esac
    seen="$seen $name"
    echo "NEW_TASK $name"
  done
  sleep 3
done
