# Kit 02: Build Your Own Tool

**Day 1, block 6 (Exercise 1).** The owner builds one skill, a reusable tool that does one
repetitive task from their bottleneck, without writing code.

## Before this kit

Kit 01 is done, and they've run Grill Me, so `00 Bottleneck/bottleneck-brief.md` exists.
They're in a Code session with their business folder (`WORK FOLDER/<Business>`) selected.

## The one prompt (owners paste this)

```
Run Kit 02 from my Documents/work-without-working-kit folder. Read kits/02-build-your-tool/SETUP.md and follow it step by step with me.
```

## Three ways to get their tool

| Path | When | What Claude does |
|---|---|---|
| **A. Pick from the catalog** | One of the [73 ready tools](catalog.md) fits | Suggests the 3 to 5 that fit their bottleneck, installs the one they pick |
| **B. Something else** | They want a tool that isn't in the catalog | Searches GitHub and skill directories, checks license and safety, reads it fully, and installs it only after they say yes |
| **C. Build from scratch** | Nothing out there fits | Writes it with them from the template |

Whichever path, Claude then makes it theirs: their own `my-<tool>` skill with their
business facts, a real example, and their rules, built on top of the installed tool.

## What Claude does with them

1. Reads their CLAUDE.md and bottleneck brief
2. Suggests 3 to 5 catalog tools that fit, plus "see all", "something else", or "from scratch"
3. Installs or finds the tool (`install-tool.sh`), or skips to building
4. Asks for one real example: what goes in, and what good looks like
5. Writes their own version in their business folder
6. Runs it on the real example and saves the result
7. Improves it once if the owner wants changes, then gives a done checklist

## They leave with

- [ ] Their own tool at `WORK FOLDER/<Business>/.claude/skills/my-<tool>/SKILL.md`
- [ ] One real output from it in `03 Outputs`
- [ ] The tool listed in `02 AI Team/my-tools.md`
- [ ] Knowing how to run it again: type `/my-<tool>` in a session in their business folder

## Files

- [catalog.md](catalog.md): the menu, by category
- [catalog.tsv](catalog.tsv): the same list for Claude and the installer (edit this one, then regenerate catalog.md)
- [install-tool.sh](install-tool.sh): installs a catalog tool by name, or an approved GitHub skill
- [extra-skills/](extra-skills/): tools that live in this kit (content-repurposing, hook-killers,
  market-and-product-fit-research, ui-image-gen, awesome-design-md)
- [templates/SKILL.md](templates/SKILL.md): the template for their own version

## Takes about

30 minutes. Keep it to one task. Good first tools: reply drafts for common customer
questions (`copywriting`), captions for a product (`37-social-caption-global`), a follow-up
for unpaid invoices (`invoice-chase` from the Small Business plugin), turning one video into
many posts (`content-repurposing`), or product photos (`ui-image-gen` with their ChatGPT).

**Helpers:** steer owners away from tasks that need logging in to another app (Facebook,
Shopee, bank). Those come later. Today's tool works on text and files on the laptop.
