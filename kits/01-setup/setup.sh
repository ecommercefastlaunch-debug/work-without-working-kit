#!/bin/bash
# Kit 01: the one-shot installer. Run once after Homebrew (Mac) or Git (Windows) is in place.
# Installs or updates: the kit files, FFmpeg, Wispr Flow, and the skills
# (grill-me, grilling, stop-slop, dumbify). Skips anything already installed; safe to re-run.
set -u

KIT_URL="https://github.com/ecommercefastlaunch-debug/work-without-working-kit.git"
KIT_DIR="$HOME/Documents/work-without-working-kit"
case "$(uname -s)" in Darwin) OS=mac;; MINGW*|MSYS*|CYGWIN*) OS=windows;; *) OS=other;; esac

ok=0; skipped=0; failed=0
INSTALLED() { echo "INSTALLED $*"; ok=$((ok+1)); }
ALREADY()   { echo "ALREADY  $*"; skipped=$((skipped+1)); }
FAILED()    { echo "FAILED   $*"; failed=$((failed+1)); }

# --- Homebrew (Mac): must already be installed; the owner runs its installer in Terminal.
if [ "$OS" = mac ]; then
  BREW="$(command -v brew 2>/dev/null || true)"
  [ -n "$BREW" ] || { [ -x /opt/homebrew/bin/brew ] && BREW=/opt/homebrew/bin/brew; }
  [ -n "$BREW" ] || { [ -x /usr/local/bin/brew ] && BREW=/usr/local/bin/brew; }
  [ "${SETUP_TEST_NO_BREW:-}" = 1 ] && BREW=""   # test hook: act as if Homebrew is missing
  if [ -z "$BREW" ]; then echo "NEEDS HOMEBREW: install Homebrew first (Kit 01 Step 2), then run this again."; exit 10; fi
  export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_CLEANUP=1
fi
command -v git >/dev/null 2>&1 || { echo "NEEDS GIT: install Git first (Kit 01 Step 2), then run this again."; exit 11; }

# --- Kit files
mkdir -p "$HOME/Documents"
if [ -d "$KIT_DIR/.git" ]; then
  if git -C "$KIT_DIR" pull -q --ff-only 2>/dev/null; then ALREADY "kit files (updated)"; else FAILED "kit files (couldn't update)"; fi
elif git clone -q "$KIT_URL" "$KIT_DIR" 2>/dev/null; then INSTALLED "kit files in Documents/work-without-working-kit"
else FAILED "kit files (couldn't download)"; fi

# --- FFmpeg and Wispr Flow
if [ "$OS" = mac ]; then
  if command -v ffmpeg >/dev/null 2>&1 || "$BREW" list ffmpeg >/dev/null 2>&1; then ALREADY ffmpeg
  elif "$BREW" install ffmpeg >/dev/null 2>&1; then INSTALLED ffmpeg
  else FAILED ffmpeg; fi

  if [ -d "/Applications/Wispr Flow.app" ] || "$BREW" list --cask wispr-flow >/dev/null 2>&1; then ALREADY "Wispr Flow"
  elif "$BREW" install --cask wispr-flow >/dev/null 2>&1; then INSTALLED "Wispr Flow"
  else FAILED "Wispr Flow (download it from https://wisprflow.ai instead)"; fi
else
  command -v ffmpeg >/dev/null 2>&1 && ALREADY ffmpeg || echo "TODO     ffmpeg: on Windows run  winget install --id Gyan.FFmpeg -e"
  echo "TODO     Wispr Flow: on Windows download it from https://wisprflow.ai"
fi

# --- Skills
SK="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"; mkdir -p "$SK"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
# repo | folder in the repo ("." = whole repo) | skill name
for line in \
  "mattpocock/skills|skills/productivity/grill-me|grill-me" \
  "mattpocock/skills|skills/productivity/grilling|grilling" \
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
