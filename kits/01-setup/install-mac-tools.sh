#!/bin/bash
# Kit 01 (Mac): installs FFmpeg and Wispr Flow with Homebrew. Skips anything already installed.
set -u

BREW="$(command -v brew 2>/dev/null || true)"
[ -n "$BREW" ] || { [ -x /opt/homebrew/bin/brew ] && BREW=/opt/homebrew/bin/brew; }
[ -n "$BREW" ] || { [ -x /usr/local/bin/brew ] && BREW=/usr/local/bin/brew; }
[ -n "$BREW" ] || { echo "FAILED   Homebrew isn't installed yet. Do Kit 01 Step 2 first."; exit 1; }

ok=0; skipped=0; failed=0
export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_CLEANUP=1

# FFmpeg (command-line tool)
if command -v ffmpeg >/dev/null 2>&1 || "$BREW" list ffmpeg >/dev/null 2>&1; then
  echo "ALREADY  ffmpeg"; skipped=$((skipped+1))
elif "$BREW" install ffmpeg >/dev/null 2>&1; then
  echo "INSTALLED ffmpeg"; ok=$((ok+1))
else
  echo "FAILED   ffmpeg"; failed=$((failed+1))
fi

# Wispr Flow (app)
if [ -d "/Applications/Wispr Flow.app" ] || "$BREW" list --cask wispr-flow >/dev/null 2>&1; then
  echo "ALREADY  Wispr Flow"; skipped=$((skipped+1))
elif "$BREW" install --cask wispr-flow >/dev/null 2>&1; then
  echo "INSTALLED Wispr Flow (open it from Applications to sign in)"; ok=$((ok+1))
else
  echo "FAILED   Wispr Flow (download it from https://wisprflow.ai instead)"; failed=$((failed+1))
fi

echo "Done: $ok installed, $skipped already there, $failed failed."
[ "$failed" -eq 0 ]
