# Kit 03: My 24/7 AI Video Editor

Claude edits your videos for you, and makes new ones: it cuts the dead air and mistakes, adds
captions, transitions, graphics and sound, and gives you a draft to approve.

Do the [Work Without Working Setup Kit](../01-setup) first. It installs Node.js, Git and FFmpeg.

This kit has two separate parts, each with its own prompt and its own install.

## A. Setup Kit

Installs **Herk Edit Kit**, Nate Herk's free video editor
([github.com/nateherkai/herk-edit-kit](https://github.com/nateherkai/herk-edit-kit), MIT license),
and the **video engine** that renders the finished MP4. Paste this in Claude:

```
Set me up with the 24/7 AI Video Editor from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/03-video-editor/SETUP.md and install it for me. I'll allow what's needed.
```

About 10 to 15 minutes. It comes with Nate's editing skills, which work in a Code session
opened in the **herk-edit-kit** folder:

| Group | Skills |
|---|---|
| Edit my video | `short-form-edit` (Reels, Shorts, short ads), `edit-video` (long videos) |
| Cutting | `cut-silences` (dead air), `cut-mistakes` (stutters and retakes; shows each cut first) |
| Visuals | `video-storytelling`, `hyperframes-video-beats` (lower thirds, callouts), `style-library` |
| Make from scratch | `make-a-video`, `website-to-hyperframes` (promo from a website link), `motion-showreel` |

To edit a clip of yourself talking, the editor needs your own ElevenLabs key. You paste it
into the kit's `.env` file yourself; Claude never sees it.

## B. Skills

25 more video skills, installed by their own script
([install-video-skills.sh](install-video-skills.sh), list in [video-skills.tsv](video-skills.tsv)) into
`~/.claude/skills`, so they work in **every** folder. Paste this in Claude:

```
Add my video skills from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/03-video-editor/SKILLS.md and install them for me.
```

| Group | Skills |
|---|---|
| Transitions & effects | `hyperframes-registry`, `motion-effects`, `sound-effects` |
| Video basics | `hyperframes`, `hyperframes-cli`, `media-use` |
| Explainers & promos | `explainer-default`, `explainer-engaging`, `explainer-high-energy`, `launch-video`, `vox-explainer`, `apple-launch-film` |
| B-roll & cutouts | `motion-broll`, `object-separation` |
| Titles, charts & loops | `title-sequence-3d`, `animated-chart`, `milestone-reveal`, `loop-cover`, `newsletter-promo` |
| Reels & clips | `reel-export`, `clip-factory` |
| Plan & brief | `brand-intake`, `motion-brief-writer`, `motion-prompt-writer`, `reference-to-motion` |

**Other way: Google Drive.** Download [video-skills.zip](https://drive.google.com/file/d/1e6LuFo21HSY-yD83-5S81xKxsK0zVJiq/view)
(also in this repo: [handout/video-skills.zip](../../handout/video-skills.zip)), then paste in Claude:

```
Install the skills from video-skills.zip in my Downloads folder.
```

Each skill is copied from its original GitHub repo with its license:
[Barty-Bart/motion-graphics](https://github.com/Barty-Bart/motion-graphics), [charlie947/motion-graphics-skills](https://github.com/charlie947/motion-graphics-skills), [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes), [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills).

## Try these

In the herk-edit-kit folder:

```
Use short-form-edit to turn my clip at [where my clip is] into a 30 to 60 second Reel, with a strong hook, captions and B-roll. Show me the cuts before you render.
```

In any folder:

```
Use explainer-high-energy to make a 15-second promo for [my product].
```
