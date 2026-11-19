#!/bin/bash
# Kit 01: the one-shot installer. Run after Homebrew (Mac) is in place; on Windows it uses winget.
# Installs or updates: Git, FFmpeg, Node.js, Google Chrome, the kit files, and the skills
# stop-slop and dumbify. Skips anything already installed; safe to re-run.
#
# Windows: winget asks to accept each package's terms. Pass --accept-terms only after the
# owner said yes to that.
set -u

KIT_URL="https://github.com/ecommercefastlaunch-debug/work-without-working-kit.git"
KIT_DIR="$HOME/Documents/work-without-working-kit"
case "$(uname -s)" in Darwin) OS=mac;; MINGW*|MSYS*|CYGWIN*) OS=windows;; *) OS=other;; esac
[ -n "${SETUP_TEST_OS:-}" ] && OS="$SETUP_TEST_OS"   # test hook
ACCEPT=""; [ "${1:-}" = "--accept-terms" ] && ACCEPT="--accept-package-agreements --accept-source-agreements"

ok=0; skipped=0; failed=0
INSTALLED() { echo "INSTALLED $*"; ok=$((ok+1)); }
ALREADY()   { echo "ALREADY  $*"; skipped=$((skipped+1)); }
FAILED()    { echo "FAILED   $*"; failed=$((failed+1)); }

# ---------- Mac: everything through Homebrew
if [ "$OS" = mac ]; then
  BREW="$(command -v brew 2>/dev/null || true)"
  [ -n "$BREW" ] || { [ -x /opt/homebrew/bin/brew ] && BREW=/opt/homebrew/bin/brew; }
  [ -n "$BREW" ] || { [ -x /usr/local/bin/brew ] && BREW=/usr/local/bin/brew; }
  [ "${SETUP_TEST_NO_BREW:-}" = 1 ] && BREW=""   # test hook: act as if Homebrew is missing
  if [ -z "$BREW" ]; then echo "NEEDS HOMEBREW: Homebrew isn't installed yet (Kit 01 Step 2). Run this again after."; exit 10; fi
  export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_CLEANUP=1 PATH="$(dirname "$BREW"):$PATH"

  brew_tool() {  # brew_tool <formula> <command to check> <label>
    if "$BREW" list "$1" >/dev/null 2>&1; then ALREADY "$3"
    elif "$BREW" install "$1" >/dev/null 2>&1; then INSTALLED "$3"
    else FAILED "$3"; fi
  }
  brew_tool git  git  Git
  brew_tool ffmpeg ffmpeg FFmpeg
  brew_tool node node "Node.js"

  if [ -d "/Applications/Google Chrome.app" ] || [ -d "$HOME/Applications/Google Chrome.app" ] \
     || "$BREW" list --cask google-chrome >/dev/null 2>&1; then ALREADY "Google Chrome"
  elif "$BREW" install --cask google-chrome >/dev/null 2>&1; then INSTALLED "Google Chrome"
  else FAILED "Google Chrome (download it from https://www.google.com/chrome instead)"; fi
fi

# ---------- Windows: everything through winget
if [ "$OS" = windows ]; then
  WINGET="$(command -v winget 2>/dev/null || command -v winget.exe 2>/dev/null || true)"
  if [ -z "$WINGET" ]; then echo "NEEDS WINGET: install 'App Installer' from the Microsoft Store, then run this again."; exit 12; fi
  win_tool() {  # win_tool <winget id> <command to check> <label>
    if [ -n "$2" ] && command -v "$2" >/dev/null 2>&1; then ALREADY "$3"; return; fi
    if "$WINGET" list --id "$1" -e >/dev/null 2>&1; then ALREADY "$3"; return; fi
    if "$WINGET" install --id "$1" -e --silent $ACCEPT >/dev/null 2>&1; then INSTALLED "$3 (close and reopen the Claude app to use it)"
    else FAILED "$3"; fi
  }
  win_tool Git.Git git Git
  win_tool Gyan.FFmpeg ffmpeg FFmpeg
  win_tool OpenJS.NodeJS.LTS node "Node.js"
  win_tool Google.Chrome "" "Google Chrome"
fi

command -v git >/dev/null 2>&1 || { echo "NEEDS GIT: Git isn't ready yet. Close and reopen the Claude app, then run this again."; exit 11; }

# ---------- Kit files
mkdir -p "$HOME/Documents"
if [ -d "$KIT_DIR/.git" ]; then
  if git -C "$KIT_DIR" pull -q --ff-only 2>/dev/null; then ALREADY "kit files (updated)"; else FAILED "kit files (couldn't update)"; fi
elif git clone -q "$KIT_URL" "$KIT_DIR" 2>/dev/null; then INSTALLED "kit files in Documents/work-without-working-kit"
else FAILED "kit files (couldn't download)"; fi

# ---------- Skills
SK="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"; mkdir -p "$SK"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
# repo | folder in the repo ("." = whole repo) | skill name
for line in \
  "hardikpandya/stop-slop|.|stop-slop" \
  "artemnovitckii/content-skills|dumbify|dumbify"; do
  repo="${line%%|*}"; rest="${line#*|}"; path="${rest%%|*}"; name="${rest#*|}"
  if [ -e "$SK/$name" ]; then ALREADY "skill $name"; continue; fi
  clone="$TMP/$(echo "$repo" | tr '/' '_')"
  [ -d "$clone" ] || git clone -q --depth 1 "https://github.com/$repo.git" "$clone" 2>/dev/null || { FAILED "skill $name (couldn't download $repo)"; continue; }
  [ -f "$clone/$path/SKILL.md" ] || { FAILED "skill $name (no SKILL.md in $repo/$path)"; continue; }
  mkdir -p "$SK/$name" && cp -R "$clone/$path/." "$SK/$name/" && rm -rf "$SK/$name/.git" "$SK/$name/.github"
  [ -f "$SK/$name/LICENSE" ] || { [ -f "$clone/LICENSE" ] && cp "$clone/LICENSE" "$SK/$name/LICENSE"; }
  INSTALLED "skill $name (from github.com/$repo)"
done

echo "Done: $ok installed, $skipped already there, $failed failed."
[ "$failed" -eq 0 ]
