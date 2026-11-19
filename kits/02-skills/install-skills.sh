#!/bin/bash
# Kit 02 Skills: installs the 60 Claude skills listed in skills.tsv into ~/.claude/skills.
# Needs Git (Kit 01). Skills from other people are copied from their original GitHub repos,
# with their LICENSE. Skips any skill that's already there; safe to re-run.
set -u
KIT_URL="${WWK_KIT_URL:-https://github.com/ecommercefastlaunch-debug/work-without-working-kit.git}"   # env = test hook

ok=0; skipped=0; failed=0
INSTALLED() { echo "INSTALLED $*"; ok=$((ok+1)); }
ALREADY()   { echo "ALREADY  $*"; skipped=$((skipped+1)); }
FAILED()    { echo "FAILED   $*"; failed=$((failed+1)); }

command -v git >/dev/null 2>&1 || { echo "NEEDS GIT: run the Work Without Working Setup Kit (Kit 01) first."; exit 11; }
SK="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"; mkdir -p "$SK"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
KIT="$TMP/kit"
git clone -q --depth 1 "$KIT_URL" "$KIT" 2>/dev/null || { echo "FAILED   couldn't download the kit (check the internet)"; exit 12; }
LIST="$KIT/kits/02-skills/skills.tsv"
[ -f "$LIST" ] || { echo "FAILED   the skill list is missing"; exit 13; }

# skills.tsv columns: category, name, what it does, repo ("kit" = this repo), path in the repo
while IFS=$'\t' read -r category name what repo path; do
  [ "$name" = name ] && continue
  if [ -e "$SK/$name" ]; then ALREADY "$name"; continue; fi
  if [ "$repo" = kit ]; then clone="$KIT"
  else
    clone="$TMP/$(echo "$repo" | tr '/' '_')"
    [ -d "$clone" ] || git clone -q --depth 1 "https://github.com/$repo.git" "$clone" 2>/dev/null || { FAILED "$name (couldn't download $repo)"; continue; }
  fi
  [ -f "$clone/$path/SKILL.md" ] || { FAILED "$name (no SKILL.md in $repo/$path)"; continue; }
  mkdir -p "$SK/$name" && cp -R "$clone/$path/." "$SK/$name/"
  rm -rf "$SK/$name/.git" "$SK/$name/.github" "$SK/$name/evals"
  [ "$repo" = kit ] || [ -f "$SK/$name/LICENSE" ] || { [ -f "$clone/LICENSE" ] && cp "$clone/LICENSE" "$SK/$name/LICENSE"; }
  # The skill's own name must match its folder, or Claude may list it twice or not at all.
  head -1 "$SK/$name/SKILL.md" | grep -q '^---' && sed -i.bak "1,/^---\$/ s/^name:.*/name: $name/" "$SK/$name/SKILL.md" && rm -f "$SK/$name/SKILL.md.bak"
  [ "$repo" = kit ] && INSTALLED "$name" || INSTALLED "$name (from github.com/$repo)"
done < "$LIST"

echo "Done: $ok installed, $skipped already there, $failed failed."
[ "$failed" -eq 0 ]
