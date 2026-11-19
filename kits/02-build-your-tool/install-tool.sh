#!/bin/bash
# Kit 02: install a tool (skill) into the personal Claude skills folder.
#
#   install-tool.sh <name>                         a tool from catalog.tsv
#   install-tool.sh --repo owner/repo --path dir --name name
#                                                  a skill found on GitHub (Path B),
#                                                  only after the owner said yes
#   install-tool.sh --list                         print the catalog names
#
# Never overwrites a skill that's already installed. Works on Mac, and on Windows in Git Bash.
set -u

HERE="$(cd "$(dirname "$0")" && pwd)"
CATALOG="$HERE/catalog.tsv"
SK="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$SK"

if [ "${1:-}" = "--list" ]; then tail -n +2 "$CATALOG" | cut -f1,2 | column -t -s $'\t'; exit 0; fi

if [ "${1:-}" = "--repo" ]; then
  repo="${2:-}"; [ "${3:-}" = "--path" ] && path="${4:-}" || path=""; [ "${5:-}" = "--name" ] && name="${6:-}" || name=""
  [ -n "$repo" ] && [ -n "$path" ] && [ -n "$name" ] || { echo "Usage: install-tool.sh --repo owner/repo --path dir --name name"; exit 2; }
else
  name="${1:-}"
  [ -n "$name" ] || { echo "Usage: install-tool.sh <name>   (see --list)"; exit 2; }
  row="$(awk -F'\t' -v n="$name" 'NR>1 && $1==n {print; exit}' "$CATALOG")"
  [ -n "$row" ] || { echo "NOT IN CATALOG  $name"; exit 3; }
  repo="$(echo "$row" | cut -f5)"; path="$(echo "$row" | cut -f6)"
fi

dest="$SK/$name"
if [ -e "$dest" ]; then echo "ALREADY  $name"; exit 0; fi

case "$name" in *[!a-z0-9-]*|"") echo "FAILED   bad skill name: $name"; exit 2;; esac

if [ "$repo" = "kit" ]; then
  src="$HERE/$path"
  [ -f "$src/SKILL.md" ] || { echo "FAILED   $name (missing from the kit folder; run git pull in work-without-working-kit)"; exit 1; }
  mkdir -p "$dest" && cp -R "$src/." "$dest/"
  echo "INSTALLED $name  (from the Work Without Working kit)"
else
  TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
  git clone -q --depth 1 "https://github.com/$repo.git" "$TMP/repo" 2>/dev/null || { echo "FAILED   $name (couldn't download github.com/$repo)"; exit 1; }
  src="$TMP/repo/$path"
  [ -f "$src/SKILL.md" ] || { echo "FAILED   $name (no SKILL.md at $repo/$path)"; exit 1; }
  mkdir -p "$dest" && cp -R "$src/." "$dest/"
  rm -rf "$dest/.git" "$dest/.github"
  [ -f "$dest/LICENSE" ] || { [ -f "$TMP/repo/LICENSE" ] && cp "$TMP/repo/LICENSE" "$dest/LICENSE"; }
  echo "INSTALLED $name  (from github.com/$repo)"
fi

# Make the skill's own name match its folder, so two tools can't share a name
# (e.g. hook-formulas-100 ships named "viral-hooks", which clashes with another tool).
current="$(sed -n 's/^name: *//p' "$dest/SKILL.md" | head -1 | tr -d "\"'")"
if [ "$current" != "$name" ]; then
  awk -v n="$name" '!done && /^name:/ {print "name: " n; done=1; next} {print}' "$dest/SKILL.md" > "$dest/SKILL.md.tmp" \
    && mv "$dest/SKILL.md.tmp" "$dest/SKILL.md" && echo "         (renamed from \"$current\" to \"$name\")"
fi

# Extra step for the design library: it reads a separate repo of design files.
if [ "$name" = "awesome-design-md" ] && [ ! -d "$HOME/Documents/awesome-design-md" ]; then
  git clone -q --depth 1 https://github.com/VoltAgent/awesome-design-md.git "$HOME/Documents/awesome-design-md" \
    && echo "         + design library downloaded to Documents/awesome-design-md"
fi
