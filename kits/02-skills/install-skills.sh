#!/bin/bash
# Kit 02 Skills: installs the Claude skills into ~/.claude/skills. Needs Git (Kit 01).
# Skills from other people come from their original GitHub repos, with their LICENSE.
# Skips any skill that's already there; safe to re-run.
set -u
KIT_URL="${WWK_KIT_URL:-https://github.com/ecommercefastlaunch-debug/work-without-working-kit.git}"   # env = test hook

ok=0; skipped=0; failed=0
INSTALLED() { echo "INSTALLED $*"; ok=$((ok+1)); }
ALREADY()   { echo "ALREADY  $*"; skipped=$((skipped+1)); }
FAILED()    { echo "FAILED   $*"; failed=$((failed+1)); }

command -v git >/dev/null 2>&1 || { echo "NEEDS GIT: run the Work Without Working Setup Kit (Kit 01) first."; exit 11; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
KIT="$TMP/kit"
git clone -q --depth 1 "$KIT_URL" "$KIT" 2>/dev/null || { echo "FAILED   couldn't download the kit's own skills"; KIT="$TMP/none"; }

# ---------- Claude skills
SK="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"; mkdir -p "$SK"
# repo | folder in the repo ("." = whole repo) | skill name.  repo "kit" = this kit's own copy.
for line in \
  "hardikpandya/stop-slop|.|stop-slop" \
  "artemnovitckii/content-skills|dumbify|dumbify" \
  "artemnovitckii/content-skills|storytelling|storytelling" \
  "coreyhaines31/marketingskills|skills/copywriting|copywriting" \
  "coreyhaines31/marketingskills|skills/product-marketing|product-marketing" \
  "coreyhaines31/marketingskills|skills/customer-research|customer-research" \
  "coreyhaines31/marketingskills|skills/social|social" \
  "coreyhaines31/marketingskills|skills/ad-creative|ad-creative" \
  "kit|kits/02-skills/skills/content-repurposing|content-repurposing" \
  "kit|kits/02-skills/skills/hook-killers|hook-killers" \
  "kit|kits/02-skills/skills/offer-builder|offer-builder" \
  "kit|kits/02-skills/skills/breakthrough-ads|breakthrough-ads"; do
  repo="${line%%|*}"; rest="${line#*|}"; path="${rest%%|*}"; name="${rest#*|}"
  if [ -e "$SK/$name" ]; then ALREADY "skill $name"; continue; fi
  if [ "$repo" = kit ]; then clone="$KIT"
  else
    clone="$TMP/$(echo "$repo" | tr '/' '_')"
    [ -d "$clone" ] || git clone -q --depth 1 "https://github.com/$repo.git" "$clone" 2>/dev/null || { FAILED "skill $name (couldn't download $repo)"; continue; }
  fi
  [ -f "$clone/$path/SKILL.md" ] || { FAILED "skill $name (no SKILL.md in $repo/$path)"; continue; }
  mkdir -p "$SK/$name" && cp -R "$clone/$path/." "$SK/$name/" && rm -rf "$SK/$name/.git" "$SK/$name/.github"
  [ "$repo" = kit ] || [ -f "$SK/$name/LICENSE" ] || { [ -f "$clone/LICENSE" ] && cp "$clone/LICENSE" "$SK/$name/LICENSE"; }
  [ "$repo" = kit ] && INSTALLED "skill $name" || INSTALLED "skill $name (from github.com/$repo)"
done

echo "Done: $ok installed, $skipped already there, $failed failed."
[ "$failed" -eq 0 ]
