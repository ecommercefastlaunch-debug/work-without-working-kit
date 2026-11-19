# Rebuilds README.md from skills.tsv. Run after editing the list: python3 gen-readme.py
import csv, collections, os
here = os.path.dirname(os.path.abspath(__file__))
rows = list(csv.DictReader(open(os.path.join(here, 'skills.tsv')), delimiter='\t'))
cats = collections.OrderedDict()
for r in rows: cats.setdefault(r['category'], []).append(r)
MIT_KIT = {'sales-objections', 'sales-followup', 'hook-killers'}
def src(r):
    if r['repo'] == 'kit':
        return f"this kit ([skills/](skills/{r['name']})){' (MIT)' if r['name'] in MIT_KIT else ''}"
    return f"[{r['repo']}](https://github.com/{r['repo']})"
table = []
for c, rs in cats.items():
    table.append(f"### {c} ({len(rs)})\n\n| Skill | What it does | Source |\n|---|---|---|")
    table += [f"| {r['name']} | {r['what it does']} | {src(r)} |" for r in rs]
    table.append('')
repos = sorted({r['repo'] for r in rows if r['repo'] != 'kit'})
kit_own = [r['name'] for r in rows if r['repo'] == 'kit']
n = len(rows)
out = f'''# Kit 02: Skills

**{n} Claude skills for sales and marketing, installed in one go**, including image making with
the owner's own ChatGPT account (through Codex). Do the Work Without Working Setup Kit
(Kit 01) first; this kit needs its Git and Node.js.

## The one prompt (owners paste this)

```
Add my skills with Kit 02 from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/02-skills/SETUP.md and install them for me.
```

## What happens

1. Claude installs all {n} skills into `~/.claude/skills` (they work in every project).
2. Claude connects Codex to the owner's ChatGPT account for images: the owner signs in
   themselves in the browser. Codex comes with the ChatGPT desktop app on a Mac, or is
   installed with npm. Codex makes still images only; it can't make videos yet.
3. A checklist by category, and 3 skills to try first.

## The skills

The list lives in [skills.tsv](skills.tsv). The installer reads it, so add or remove a row
there to change the kit, then run `python3 gen-readme.py` to rebuild this page.

{chr(10).join(table)}
## Where they come from

All third-party skills are MIT licensed and copied from their original GitHub repos with
their LICENSE: {", ".join(repos)}. The kit's own skills are in [skills/](skills/):
{", ".join(kit_own)}. sales-objections and sales-followup come from
zubair-trabzada/ai-sales-team-claude (MIT) with a name and description header added so Claude
can find them.

Every skill was checked before it was added: MIT license, updated in the last year, no
passwords or paid accounts needed, nothing that sends the owner's data anywhere or runs
downloaded code. Notes: local-seo-manager includes small offline Python helpers, a few skills
can read a web page if the owner gives them a link, and image-generation uses the owner's
own ChatGPT plan (and its daily image limits).

## Files

- [SETUP.md](SETUP.md): the steps Claude follows
- [skills.tsv](skills.tsv): the list (category, name, what it does, repo, path)
- [install-skills.sh](install-skills.sh): installs everything on the list (safe to re-run; skips what's there)
- [gen-readme.py](gen-readme.py): rebuilds this README from the list
- [skills/](skills/): the skills that live in this kit

## Takes about

5 to 10 minutes, including the ChatGPT sign-in.
'''
open(os.path.join(here, 'README.md'), 'w').write(out)
print(n, {c: len(v) for c, v in cats.items()})
