# Kit 03: 24/7 Video Editor

Installs Nate Herk's video-editing kit, then edits one of the owner's real clips with them:
Claude cuts dead air and mistakes, adds captions, and renders a draft the owner approves.

## Before this kit

Kit 01 (Setup) is done, so Git, FFmpeg, Node.js and Chrome are already installed. The owner has one
short raw clip (1 to 3 minutes of them talking) on the laptop.

**This is the heaviest kit.** It needs Node.js 22 or newer, Git, FFmpeg, and Chrome,
which Kit 01 installs. What's left is the kit's own download and setup.
Helpers: install these on laptops the night before where you can. If a laptop can't get
them, that owner watches the facilitator's demo instead.

**Transcription needs an ElevenLabs API key** (the owner's own account). Without one,
the kit installs and runs its demo, but can't cut a real clip by its words.

## The one prompt (owners paste this into Claude)

```
Run Kit 03 from my Documents/work-without-working-kit folder. Read kits/03-video-editor/SETUP.md and follow it step by step with me.
```

## What happens

1. Claude checks Node.js, Git, FFmpeg, and Chrome, and helps install what's missing
2. Downloads and sets up the Herk Edit Kit in Documents
3. The owner adds their own ElevenLabs key (Claude never types keys)
4. Renders the kit's demo video to prove it works
5. Edits one of their real clips; the owner approves the cuts and the draft

## They leave with

- [ ] `Documents/herk-edit-kit` installed and its demo rendered
- [ ] One edited draft of their own clip

## Takes about

30 minutes to install on a prepared laptop, 60+ on a fresh one. The edit itself takes
several minutes per clip.

## Credits

[Herk Edit Kit](https://github.com/nateherkai/herk-edit-kit) by Nate Herk, built on
[HyperFrames](https://github.com/heygen-com/hyperframes). See its LICENSE.
