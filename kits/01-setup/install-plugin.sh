#!/bin/bash
# Kit 01: installs Anthropic's Small Business plugin (44 skills for running a small
# business) from github.com/anthropics/knowledge-work-plugins (Apache-2.0).
set -u

# Find the claude command: on PATH, or the copy inside the Claude desktop app (Mac).
CLAUDE="$(command -v claude 2>/dev/null || true)"
if [ -z "$CLAUDE" ]; then
  CLAUDE="$(ls -d "$HOME/Library/Application Support/Claude/claude-code/"*/*/claude.app/Contents/MacOS/claude 2>/dev/null | sort -V | tail -1)"
fi
if [ -z "$CLAUDE" ] && [ -n "${APPDATA:-}" ]; then
  CLAUDE="$(ls -d "$APPDATA/Claude/claude-code/"*/*/claude.exe "$APPDATA/Claude/claude-code/"*/claude.exe 2>/dev/null | sort -V | tail -1)"
fi
if [ -z "$CLAUDE" ]; then
  echo "FAILED   couldn't find the claude command. Ask a helper."; exit 1
fi

if "$CLAUDE" plugin list 2>/dev/null | grep -q "small-business"; then
  echo "ALREADY  small-business plugin"; exit 0
fi

"$CLAUDE" plugin marketplace add anthropics/knowledge-work-plugins >/dev/null 2>&1 || true
if "$CLAUDE" plugin install small-business@knowledge-work-plugins 2>&1 | tail -2; then
  if "$CLAUDE" plugin list 2>/dev/null | grep -q "small-business"; then
    echo "INSTALLED small-business plugin (from github.com/anthropics/knowledge-work-plugins)"; exit 0
  fi
fi
echo "FAILED   small-business plugin. Ask a helper."; exit 1
