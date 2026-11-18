# Kit 06: 24/7 Video Editor

**Day 1, blocks 12 and 14 (Exercise 3).** Installs Nate Herk's video-editing kit, then
runs the first full loop: the AI Chief in Grok sends an edit job, Claude edits one real
clip, and the owner approves the draft.

## Before this kit

Kits 01 to 05 are done. The owner has one short raw clip (1 to 3 minutes of them talking)
on the laptop.

**This is the heaviest kit.** It needs Node.js 22 or newer, Git, FFmpeg, and Chrome.
Helpers: install these on laptops the night before where you can. If a laptop can't get
them, that owner watches the facilitator's demo instead.

**Transcription needs an ElevenLabs API key** (the owner's own account). Without one,
the kit installs and runs its demo, but can't cut a real clip by its words.

## The one prompt (owners paste this into Claude)

```
Run Kit 06 from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/06-video-editor/SETUP.md (it's also in my Documents/work-without-working-kit folder) and follow it step by step with me.
```

## What happens

1. Claude checks Node.js, Git, FFmpeg, and Chrome, and helps install what's missing
2. Downloads and sets up the Herk Edit Kit in Documents
3. The owner adds their own ElevenLabs key (Claude never types keys)
4. Renders the kit's demo video to prove it works
5. Exercise 3: Grok sends "edit my clip", Claude edits it, the owner approves the draft

## They leave with

- [ ] `Documents/herk-edit-kit` installed and its demo rendered
- [ ] One edited draft of their own clip

## Takes about

30 minutes to install on a prepared laptop, 60+ on a fresh one. The edit itself takes
several minutes per clip.

## Credits

[Herk Edit Kit](https://github.com/nateherkai/herk-edit-kit) by Nate Herk, built on
[HyperFrames](https://github.com/heygen-com/hyperframes). See its LICENSE.
