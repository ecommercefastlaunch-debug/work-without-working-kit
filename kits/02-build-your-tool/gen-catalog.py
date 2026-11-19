#!/usr/bin/env python3
"""Regenerates catalog.md (the readable menu) from catalog.tsv. Run after editing catalog.tsv:
    python3 gen-catalog.py
"""
import csv, collections, os

here = os.path.dirname(os.path.abspath(__file__))
rows = list(csv.DictReader(open(os.path.join(here, "catalog.tsv")), delimiter="\t"))
groups = collections.OrderedDict()
for r in rows:
    groups.setdefault(r["category"], []).append(r)

def src(r):
    if r["source"] == "kit":
        return "this kit"
    if r["source"] == "plugin":
        return "[anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins)"
    return f'[{r["source"]}](https://github.com/{r["source"]})'

out = ["# Tool catalog", "",
       "Every tool here is a Claude skill you can install with one command. Pick one that fits your",
       "bottleneck, then Kit 02 helps you make it yours: tuned to your business and tested on real work.",
       "", f"**{len(rows)} tools.** Install one with:", "",
       "```", "bash ~/Documents/work-without-working-kit/kits/02-build-your-tool/install-tool.sh <tool-name>", "```", "",
       "Tools marked *installed in Kit 01* are already on your laptop.", ""]
for cat, rs in groups.items():
    out += [f"## {cat}", "", "| Tool | What it does | Needs | From |", "|---|---|---|---|"]
    for r in rs:
        out.append(f'| `{r["name"]}` | {r["what it does"]} | {r["needs"]} | {src(r)} |')
    out.append("")
out += ["## Inside the Small Business plugin", "",
        "After `install-tool.sh small-business`, just describe what you need in plain words and it picks the right tool. A few that fit most owners:", "",
        "| Say something like | Tool |", "|---|---|",
        "| \"Who owes me money?\" | `invoice-chase` |",
        "| \"Write a proposal for this client\" | `proposal-builder` |",
        "| \"Reply to this bad review\" | `review-reputation` |",
        "| \"How's my cash looking?\" | `cash-flow-snapshot` |",
        "| \"Make this week's social posts\" | `social-content-engine` |",
        "| \"Write a job post\" / \"Screen these applicants\" | `job-post-builder`, `hiring-screener` |",
        "| \"Help me answer customer questions faster\" | `ticket-deflector`, `speed-to-lead` |",
        "| \"What should I restock?\" | `inventory-planner`, `restock` |", "",
        "Don't connect other apps to it during the retreat; it works from pasted text and files.", "",
        "## Comes with Kit 06: the 24/7 video editor", "",
        "`edit-video`, `short-form-edit`, `cut-silences`, `cut-mistakes`, `make-a-video`, `video-storytelling` and more,",
        "from [nateherkai/herk-edit-kit](https://github.com/nateherkai/herk-edit-kit). They work inside the `herk-edit-kit` folder.", "",
        "## Not in the catalog, and why", "",
        "- **Built for one brand or person:** voice profiles, house editing styles and branded deck builders only make sense for the business they were made for. Kit 02 helps you build your own instead.",
        "- **Needs extra review first:** tools that scrape other sites or install large AI models.",
        "- **Built for programmers:** coding workflow plugins.", ""]
open(os.path.join(here, "catalog.md"), "w").write("\n".join(out))
print(f"catalog.md: {len(rows)} tools in {len(groups)} groups")
