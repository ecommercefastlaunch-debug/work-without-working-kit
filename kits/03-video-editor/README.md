# Kit 03: My 24/7 AI Video Editor

Claude edits your videos for you: it cuts the dead air and mistakes, adds captions and
graphics, and gives you a draft to approve. It uses **Herk Edit Kit**, Nate Herk's free
video-editing kit ([github.com/nateherkai/herk-edit-kit](https://github.com/nateherkai/herk-edit-kit), MIT license).

Do the [Work Without Working Setup Kit](../01-setup) first. It installs Node.js, Git and FFmpeg.

## A. Setup Kit

Paste this in Claude:

```
Set me up with the 24/7 AI Video Editor from https://github.com/ecommercefastlaunch-debug/work-without-working-kit. Read kits/03-video-editor/SETUP.md and install it for me. I'll allow what's needed.
```

| Installs | What it's for |
|---|---|
| Herk Edit Kit | Nate Herk's video editor, in `Documents/herk-edit-kit` |
| Video engine | HyperFrames and the browser it renders with |
| Demo video | Proves everything works |
| ElevenLabs key (optional) | Lets Claude edit by what you say. You paste your own key; Claude never sees it |

About 10 to 20 minutes.

## B. Skills

The video skills only work in a Code session opened in the **herk-edit-kit** folder.

| Group | Skills |
|---|---|
| Edit my video | `short-form-edit` (Reels, Shorts, short ads), `edit-video` (long videos) |
| Cutting | `cut-silences` (dead air), `cut-mistakes` (stutters and retakes; shows each cut first) |
| Visuals | `video-storytelling`, `hyperframes-video-beats` (lower thirds, callouts), `style-library` |
| Make from scratch | `make-a-video`, `website-to-hyperframes` (promo from a website link), `motion-showreel` |
| Behind the scenes | `hyperframes`, `hyperframes-cli`, `hyperframes-registry`, `gsap`, `short-form-video` (old version) |

**Try these** (replace the [brackets]):

```
Use short-form-edit to turn my clip at [where my clip is] into a 30 to 60 second Reel, with a strong hook, captions and B-roll. Show me the cuts before you render.
```

```
Use edit-video to edit my recording at [where my clip is]. Cut the dead air, show me the mistake cuts, add captions, and give me a draft.
```

```
Use website-to-hyperframes to make a 20-second promo video from [my website link].
```
