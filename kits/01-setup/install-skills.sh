#!/bin/bash
# Kit 01: installs the starter skills into the personal Claude skills folder.
# Works on Mac, and on Windows inside Claude Code's Git Bash.
# Never overwrites a skill that's already there. Each skill comes from its original
# GitHub repo; all are MIT licensed.
set -u

SK="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$SK"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# repo | folder inside the repo ("." = whole repo) | skill name
SKILLS="
mattpocock/skills|skills/productivity/grill-me|grill-me
mattpocock/skills|skills/productivity/grilling|grilling
hardikpandya/stop-slop|.|stop-slop
artemnovitckii/content-skills|dumbify|dumbify
coreyhaines31/marketingskills|skills/copywriting|copywriting
coreyhaines31/marketingskills|skills/copy-editing|copy-editing
coreyhaines31/marketingskills|skills/customer-research|customer-research
"

ok=0; skipped=0; failed=0
echo "Installing starter skills into: $SK"

for line in $SKILLS; do
  repo="${line%%|*}"; rest="${line#*|}"; path="${rest%%|*}"; name="${rest#*|}"
  dest="$SK/$name"
  if [ -e "$dest" ]; then
    echo "ALREADY  $name"; skipped=$((skipped+1)); continue
  fi
  clone="$TMP/$(echo "$repo" | tr '/' '_')"
  if [ ! -d "$clone" ]; then
    git clone -q --depth 1 "https://github.com/$repo.git" "$clone" 2>/dev/null || { echo "FAILED   $name (couldn't download $repo)"; failed=$((failed+1)); continue; }
  fi
  src="$clone/$path"
  if [ ! -f "$src/SKILL.md" ]; then
    echo "FAILED   $name (no SKILL.md at $repo/$path)"; failed=$((failed+1)); continue
  fi
  mkdir -p "$dest"
  cp -R "$src/." "$dest/"
  rm -rf "$dest/.git" "$dest/.github"
  # keep the author's license next to the skill
  [ -f "$dest/LICENSE" ] || { [ -f "$clone/LICENSE" ] && cp "$clone/LICENSE" "$dest/LICENSE"; }
  echo "INSTALLED $name  (from github.com/$repo)"; ok=$((ok+1))
done

echo "Done: $ok installed, $skipped already there, $failed failed."
[ "$failed" -eq 0 ]
