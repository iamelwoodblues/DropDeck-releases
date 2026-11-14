# DropDeck Wiki

Everything DropDeck does, top to bottom. Written for DropDeck 0.5.7, 14 November 2026. For the download and a quick start, see the [README](README.md).

## Overview

DropDeck is a macOS app that plays MilkDrop presets full screen on a second display while you run the show from your MacBook, like a VJ desk. You line up the next preset in **Preview**, then **TAKE** it live on the beat, or switch on **Auto** and let DropDeck follow the music by itself.

|  |  |
| --- | --- |
| Platform | macOS 13 or later, Apple Silicon (M1 or later) |
| Current version | 0.5.7 |
| Visuals engine | libprojectM 4.1.8, patched for DropDeck (LGPL-2.1, linked dynamically) |
| Presets | MilkDrop `.milk` and projectM `.prjm` files, imported by you |
| Audio | Any input device, or *This Mac's audio* (macOS 14.2 or later) |
| Control | Mouse and keyboard, MIDI controllers, a phone remote over Wi-Fi |
| Downloads | [DropDeck-releases](https://github.com/iamelwoodblues/DropDeck-releases/releases/latest) |

### The big ideas

- **Preview and PROGRAM.** Two monitors sit side by side. Preview is yours alone: try a preset there. PROGRAM is what the audience sees. TAKE blends Preview into PROGRAM with a transition, timed to the next beat, bar or phrase.
- **Beat sync.** DropDeck listens to the music, finds the tempo and the first beat of each bar, and times takes, effects, overlays and Auto to it.
- **Auto.** An auto-pilot that changes presets every so many beats, bars or phrases. Its **Flow** order picks each preset to look and feel close to the last one, like a DJ blending tracks.
- **A managed library.** Presets are copied into DropDeck's own library, checked on your Mac for speed, and tagged automatically by colour, brightness, motion, pace and how they follow the beat.
- **Layers on top.** Logo, image, GIF and text overlays, eight pads that pop a picture on screen, and eight FX buttons (strobe, hue, invert, mirrors, quad, kaleido, prism).
- **Built for live use.** The visuals run in a separate process. If a preset crashes, the controls keep working and the output is back within about a second.

### Who it is for

DropDeck is for anyone putting visuals on a projector or TV behind music: VJs, DJs who want visuals without a second operator, bands, parties and venues. It works with one screen too, playing the output in a window.

## Getting started

You need an Apple Silicon Mac on macOS 13 or later, a second display (optional), and a folder of MilkDrop presets. DropDeck comes with no presets; the welcome screen points to a free pack.

### Install

1. Download `DropDeck-<version>-macOS-AppleSilicon.zip` from the [latest release](https://github.com/iamelwoodblues/DropDeck-releases/releases/latest).
2. Unzip it and drag **DropDeck** to Applications.
3. Open it. DropDeck isn't notarised yet, so macOS refuses the first time. Go to **System Settings › Privacy & Security** and click **Open Anyway** (on macOS 13 and 14 you can Control-click the app and choose **Open**). After that it opens normally.

### The welcome screen

The welcome screen opens on first launch. It has three parts:

- **Get your presets** links to [Cream of the Crop](https://github.com/projectM-visualizer/presets-cream-of-the-crop), about 9,800 free presets, with three steps: download (Code › Download ZIP), unzip, import.
- **Drop a folder of presets here**, a dashed box you drop a folder on, or click **Choose folder…**. DropDeck keeps its own copy, so the download can go to the Trash afterwards.
- **How it works**: Cue, Take, or go Auto.

Tick **Don't show this again** to skip it. Bring it back from **Setup › App › Show the welcome screen** or from the help window.

### Importing your first presets

The import runs inside the welcome window, one step after another. It first surveys the folder and shows what it found:

| Found | What happens |
| --- | --- |
| New presets | Copied into a pack you name, keeping their subfolders |
| Presets already in your library | Skipped. A preset counts as the same when its contents match, whatever it is called |
| Same name, different contents | Imported as "Name (2)" |
| Duplicates within the folder | Counted once |
| New textures | Copied with the pack |
| Files only stored online (iCloud Drive, OneDrive) | Skipped: download them in Finder, then import again |
| Presets you deleted before | Left out, unless you tick **Bring them back** |

Name the pack (default "Imported presets") and click **Import**. Each copy is read back and checked. When it finishes, DropDeck offers **Move originals to the Trash**: only files now safely in your library go; anything else in that folder stays. New presets are checked in the background.

### First start

- **Allow microphone access** when macOS asks, so the visuals can hear the music. For *This Mac's audio*, macOS asks for screen and system audio recording permission instead.
- DropDeck makes thumbnails and checks every preset in the background. Click **STOP OUTPUT** (top right) to let it check much faster.

### Your first show

1. Plug in the second display. The output goes full screen there automatically. With one display it plays in a window behind the controls.
2. Click a preset to **cue** it in Preview. Only you see Preview.
3. Press **Space** (or click **TAKE**) to blend it onto PROGRAM on the beat.
4. Or click **AUTO** and DropDeck changes presets by itself on the bar or phrase.
5. Press **?** any time to see every shortcut.

## The console at a glance

The console is one window in five areas: the top bar, the live controls (PREVIEW, the take column, PROGRAM and MASTER), the library underneath, the side panel on the right, and the status bar along the bottom.

```text
┌────────────────────────────────────────────────────────────────────────────┐
│ TOP BAR   MANUAL | AUTO · BPM · TAP · Beat 1 · Auto status                 │
│           help · STOP OUTPUT · QUIT                                        │
├─────────────┬────────────┬─────────────┬────────┬──────────────────────────┤
│ PREVIEW     │ Take       │ PROGRAM     │ MASTER │ SIDE PANEL               │
│ cued preset │ Transition │ live preset │ Level  │ ┌──────────────────────┐ │
│ only you    │ TAKE  CUT  │ what the    │ FADE   │ │ PADS & FX            │ │
│ see it      │ HOLD  FAV  │ audience    │        │ │ 8 pads, 8 FX buttons │ │
│             │ T-bar      │ sees        │        │ └──────────────────────┘ │
├─────────────┴────────────┴─────────────┴────────┤ ┌──────────────────────┐ │
│ LIBRARY                                         │ │ Tabs                 │ │
│ ┌───────────┐ ┌──────────────────────────────┐  │ │ Auto     Display     │ │
│ │ List      │ │ Search · Filters · Sort · …  │  │ │ Overlays Audio       │ │
│ │ All       │ └──────────────────────────────┘  │ │ Control  Setup       │ │
│ │ Faves     │ ┌──────────────────────────────┐  │ │ Info                 │ │
│ │ Cue list  │ │ Preset tiles                 │  │ └──────────────────────┘ │
│ │ Playlists │ │ click to cue                 │  │                          │
│ │ Folders   │ │ double-click to take         │  │                          │
│ └───────────┘ └──────────────────────────────┘  │                          │
├─────────────────────────────────────────────────┴──────────────────────────┤
│ STATUS BAR  Engine · FPS · FRAME · CPU · HEAT · AUDIO · MIDI · check       │
│             messages · full screen                                         │
└────────────────────────────────────────────────────────────────────────────┘
```

PROGRAM, the live picture, is the one box the audience sees; everything else is yours.

### Top bar

From left to right:

| Control | What it does |
| --- | --- |
| Logo | Animated DROPDECK logo. Hover for the version and build |
| **MANUAL \| AUTO** | Manual: you choose and take every preset. Auto: DropDeck picks and takes presets on the beat · A |
| BPM readout | The tempo, with its state underneath: listening, detecting, locked, tapped, manual or no audio |
| Beat lights | One light per beat of the bar; the big one is Beat 1 |
| bar n/N | Where you are in the current phrase |
| **TAP** | Tap along to set the tempo · T |
| **½** and **×2** | Halve or double the tempo |
| **Beat 1** | Press on the first beat of a bar to line the bars up · 1 |
| ⟳ | Re-detect the tempo (takes a few seconds) |
| Auto status | What Auto is doing: Next in 12 beats, Preparing next…, Checking next…, Mixing…, Held or Paused |
| **?** | Help and shortcuts |
| **STOP OUTPUT** / **START OUTPUT** | Turn the output off (presets then check at full speed) and back on |
| **QUIT** | Close DropDeck. It asks first while the output is live · ⌘Q |

### Live controls

The row under the top bar holds the two monitors with the take column between them and the master strip on the right. See [Preview and PROGRAM](#preview-and-program).

- **PREVIEW** (left): what's cued. Only you see it.
- **Take column** (centre): TRANSITION, LENGTH and ON at the top; TAKE, CUT, HOLD and FAVOURITE at the bottom; the T-bar beside them.
- **PROGRAM** (right): what the audience sees.
- **MASTER** strip: the master fader with its level and the FADE (blackout) button.

Under each monitor, a caption gives the preset's name and a row of icons for what it is like. Rest the mouse on the icons and they unfurl into a card of everything its tags hold.

### Library

The library fills the rest of the window under the live controls. A list on its left picks what to show (All presets, Favourites, Cue list, playlists, Recently played, Needs attention, Not checked yet and Folders); the tiles show those presets. A toolbar above holds search, Preset Filters, sort, detail, thumbnail size and the speed filter. See [The preset library](#the-preset-library).

### Side panel

The panel on the right opens with **PADS & FX** at the top: the eight pads, the eight FX buttons and **All FX off**. Below them are seven tabs: **Auto**, **Display**, **Overlays**, **Audio**, **Control**, **Setup** and **Info**. The » button folds the panel to a narrow rail of just the pads and FX, which gives the monitors and library more room; « unfolds it.

### Status bar

From left to right:

| Readout | What it shows |
| --- | --- |
| Engine light | Green while the output runs. It swells yellow when the picture stutters, and stays yellow after five stutters in a minute |
| FPS | Pictures per second the audience sees, against the target |
| FRAME | Time per frame against the frame budget |
| CPU | CPU and memory (100% = one core) |
| HEAT | How hard the Mac works to stay cool: amber or red means lower the resolution |
| AUDIO | A stereo spectrum, 20 Hz to 20 kHz, left channel above and right below |
| MIDI | Lights up when MIDI arrives |
| Check status | Checking 1,204 of 9,800 · about 3 min left, with pause and stop |
| Messages | The latest messages take turns; click them, or the list icon, to see recent ones |
| Uptime and helm | How long DropDeck has run, beside a slowly turning helm |
| Full screen | Fills the screen with the controls and back · ⌃⌘F |

Clicking the engine light, FPS, FRAME, CPU or HEAT opens the Performance panel (see Performance panel and messages, below).

## Preview and PROGRAM

Every change of preset goes through two monitors: you **cue** a preset into PREVIEW, which only you see, then **take** it to PROGRAM, which the audience sees. A take blends with a transition and starts on the next beat by default.

### Cueing a preset

- **Click** a preset tile, or select it with the arrow keys and press **Return**. It loads into Preview; while it loads, the picture dims and says Loading….
- **Double-click** a tile to cue it and take it as soon as it has loaded (Loading · then takes).
- Right-click a tile and choose **Cue** or **Take now**.
- From MIDI: **Cue next**, **Cue previous** and **Cue random** step through what the library shows.

When the output is off, clicking a preset **auditions** it in Preview instead; it becomes the cued preset when the output starts again.

### Taking it live

Press **TAKE**, or **Space**. The take column decides how:

| Setting | Choices | Default |
| --- | --- | --- |
| TRANSITION | 15 kinds, below | Morph |
| LENGTH | A number of beats or seconds (dimmed for Cut, which has none) | 8 beats |
| ON | Now, Beat, Bar or Phrase: when the take starts | Beat |

While a take waits for its beat, TAKE turns amber and says **WAITING** with a countdown; press it again to go now, or click **cancel** on the button. While it mixes, pink slides across TAKE and PROGRAM glows; press TAKE again to finish at once (press to finish). The badge on the picture says Taking in 2.0 beats, or MIXING 40%.

When the take is through, the two swap: the new preset is live, and the one that was live waits in Preview, marked **Previous preset**. Press TAKE again to swap back.

**CUT** (or **X**) switches instantly, still on the ON boundary.

### Transitions

| Transition | What you see |
| --- | --- |
| Morph | Morphs the current picture into the new preset. The most natural |
| Plasma | Flows in through cloudy noise |
| Circle | A soft circle grows or shrinks between the two |
| Sweep | A soft edge passes across at a random angle |
| Warp | The old picture stretches away as the new one stretches in |
| Zoom blur | A radial blur carries the old picture into the new |
| Crossfade | A plain blend of the two pictures |
| Cut | Switches instantly. Best on a beat or bar |
| Dip to black | Fades out to black, then fades the new one in |
| Additive glow | Adds the two together for a bright, glowing blend |
| Wipe | A soft edge sweeps across from left to right |
| Luma burn | The new preset burns in through its brightest parts first |
| Zoom | The new preset zooms in from the centre |
| Dissolve | The new preset appears through random speckles |
| Iris | A circle opens from the centre to show the new preset |

Auto can pick a transition at random from a set you choose; see [Auto](#auto).

### The T-bar

The T-bar beside TAKE fades Preview in by hand: drag it to the other end. It follows every take too, down on one and back up on the next, so it always rests at the end the next take starts from. Grabbing it mid-take hands the running fade over to your hand. A Cut setting fades as a Crossfade on the T-bar.

### HOLD and FAVOURITE

- **HOLD** (or **H**) keeps what's live: Auto won't change it until you press it again, and it calls off a change Auto had already scheduled. TAKE and CUT still work. It glows while holding, and PROGRAM shows HELD.
- **FAVOURITE** (or **F**) stars the live preset, the same star as in the library.

Right-click TAKE, CUT, HOLD or FAVOURITE to learn a MIDI shortcut for it.

### MASTER and blackout

- **MASTER** is the output level. Double-click it for full.
- **FADE** (or **B**) is the blackout: a fade to black, and back when pressed again, taking as long as **Blackout fade** in the Display tab. The master fader slides down as the output fades out and up again as it returns. PROGRAM shows BLACKOUT meanwhile.

### What DropDeck learns from your takes

Each take counts a play and sets the preset's last-played time. Holding a preset counts as held, once per play. Taking a preset off by hand within 8 seconds of putting it live counts as **pulled early**. These feed the Most played, Most held and Recently played sorts, and the Recommended sort.

## The preset library

DropDeck keeps its own copy of every preset you import, in packs, and recognises each preset by what is in the file rather than its name. A preset's favourite, tags, play history, speed results and thumbnail stay with it even if it is renamed or moved.

### Importing more presets

- Click **+** next to *Library* and choose **Import presets…**, or
- drag a folder of presets onto the DropDeck window.

Either way the import opens in the welcome window and works as in [Getting started](#getting-started): survey, name the pack, copy, then offer to move the originals to the Trash. Any folder of `.milk` or `.prjm` files works, subfolders included.

### The library list

The list on the left of the library picks what the tiles show. Drag the line between the list and the tiles to make it wider or narrower.

| Row | Shows |
| --- | --- |
| All presets | Everything in the library |
| Favourites | Starred presets |
| Cue list | Your running order, with saved playlists indented under it |
| Recently played | The last 300 presets played, newest first |
| Needs attention | Presets skipped in Auto, or that failed to load, crashed or froze when played |
| Not checked yet | Presets still waiting for their check |
| Folders | Each pack, with its subfolders folding open underneath |

Right-click a pack for **Reveal in Finder**, **Delete pack…** or **Delete folder…**. **Rescan folders** reads the library from disk again.

### The toolbar

| Control | What it does |
| --- | --- |
| Search | Matches every word you type against preset names and folders · ⌘F |
| Preset Filters | Narrows the list by look, motion and tags; see [Preset Filters](#preset-filters-saved-looks-and-find-similar-looks) |
| Sort | Name, Folder, Recommended, Most played, Most held, Recently played, Lightest first, Slowest first, Beat strength or Shuffle |
| Detail | How much each tile shows: Minimal (names only), Standard (colour dots and a tag line) or Detailed |
| Thumbnail size | A slider, shown when there is room. Pinching on the trackpad works anywhere |
| Speed filter | All presets, Hide too slow, or Smooth only |
| Count | How many presets are shown |
| Check… | Check this list, or Check all presets, on this Mac; see [Checking presets](#checking-presets) |

**Sorting notes.** *Recommended* favours favourites, presets you hold and presets you play often, and sinks presets pulled early, skipped or broken. *Lightest first* sorts by how hard a preset works your Mac. *Slowest first* sorts by pace. *Beat strength* puts presets that lock to the beat first. Unchecked presets go last in the tag-based sorts. *Shuffle* gives a random order; pick it again for a new one.

### Tiles

Each tile shows the preset's thumbnail and name, and as much of its tags as *Detail* allows. Badges mark a tile **PREVIEW** or **LIVE**, and **heavy** or **too slow** when the check found it slow on this Mac. A preset still being checked says *checking…*; one that can't render says so.

Rest the mouse on a tile to see it **playing live** in the thumbnail (turn this off with **Preview on hover** in Setup).

### Working with a preset

| Do this | To |
| --- | --- |
| Click | Cue it in Preview |
| Double-click | Cue it and take it live |
| Arrow keys | Move through presets |
| Return | Cue the selected preset |
| S | Favourite or unfavourite the selected preset |
| I | Open everything about it in the Info tab |

The right-click menu has: **Cue** · **Take now** · **Favourite** · **Add to cue list** (or Remove, Move up, Move down in a list) · **Add to playlist** · **Find similar looks** · **Skip in Auto** / **Allow in Auto** · **Clear warning** · **Tags** (quick tags and More tags…) · **Check again** · **New thumbnail** · **Reveal in Finder** · **Delete…**.

**Double-click PROGRAM** to jump the library to the live preset: it is selected and scrolled to in the list you are in, or in All presets when your list, search or filters don't have it.

### Favourites and your own tags

- **Favourites**: right-click › Favourite, press **S** on a selected preset, or **F** (or the FAVOURITE button) for the live one.
- **Your tags** are hashtags you add yourself. Four quick tags come ready: **#Intro**, **#Peak**, **#Chill** and **#Closer**. Toggle them from the right-click menu's *Tags*; add new ones in the Info tab. Your tags appear in Preset Filters, and MIDI can toggle quick tags on the live preset.

### The cue list and playlists

The **cue list** is your running order for the night. Right-click presets and choose **Add to cue list**; reorder them with Move up and Move down. Auto can play from it.

- **Save as playlist** keeps the cue list under a name to load later. Saved playlists sit under the cue list.
- Right-click a playlist to **Load into cue list** (replace), **Add to cue list** (append), **Update from cue list** or **Delete playlist**.
- **+ › New playlist** makes an empty one; then right-click presets and choose *Add to playlist*.
- **+ › New playlist from these** and **Add these to playlist** take every preset the library shows right now, in order, whatever narrowed it: a search, filters, a look or similar looks.

### Deleting presets

Right-click a preset and choose **Delete…**, or a pack or folder and choose **Delete pack…** / **Delete folder…**. After you confirm, the files go to the Trash, their favourites, tags and plays are forgotten, they leave the cue list and playlists, and future imports skip them (unless you tick *Bring them back*). What's live keeps playing until the next take. **Skip in Auto** is the gentler choice for a preset you just don't want Auto to play.

### Coming from an older DropDeck

Older versions read preset folders where they were. The first launch of a newer version moves those folders into the library, one pack each, bringing favourites, tags, thumbnails, the cue list and playlists along; the original folders are left as they were. A folder it can't find is left out: import it when it's back and its details return with it.

## Preset Filters, saved looks and Find similar looks

**Preset Filters** narrow the library by what presets look like, how they move and how they follow the music, such as "dark, slow tunnels on the beat". Save a set as a **look** to bring it back in one click. **Find similar looks** lists the presets closest to one you pick. Auto plays whatever the library shows, so all three steer Auto too.

### The Preset Filters window

Click **Preset Filters** in the library toolbar. Each group narrows the list; within a group you pick any of the choices.

| Group | Choices | How it narrows |
| --- | --- | --- |
| Colours | Red, Orange, Yellow, Green, Cyan, Blue, Purple, Pink, White, Rainbow | Pick the colours you want: a preset with a colour you didn't pick is left out. Rainbow counts as a colour of its own |
| Brightness and energy | Any · Dark · Light, and Any · Calm · Stroby | One of each |
| Pace | Slow, Medium, Fast | Any picked |
| Motion | Tunnel, Zoom out, Spin, Spiral, Drift, Kaleidoscope, Warp, Still | Only what you pick: a preset that also moves another way is left out |
| Music | Any · On the beat · Strong beat · Ignores beat, and Bass, Hi-hats, Overall level, Mixed | *On the beat* means loose or strong. The second row is what drives the preset |
| Warnings | No flashes, No blackouts, No missing textures | Each one ticked leaves those presets out |
| Your tags | Your hashtags | Any of them |

So picking every colour but White hides every preset with white in it, and picking Tunnel hides a tunnel that also spins. Your own tags stay "any of".

What is active shows above the tiles as chips, each with × to remove it, and **Clear all**.

### Saved looks

Type a name under the filters and click **Save look**. Saved looks are listed at the top of the Preset Filters window: click one to apply it, right-click to delete it. A look in use shows above the presets as one card with its name; click the card to remove it. Its filters stay in the Preset Filters window. MIDI can apply a saved look (Saved look 1, 2, …).

### Find similar looks

Right-click a preset, in the library or on PROGRAM, and choose **Find similar looks**. The library switches to All presets and lists up to 60 checked presets that look most like it, nearest first. It compares colours (neighbouring hues count as close), brightness, the ways the preset moves, pace and detail.

A card above the list says *Similar to …*; click it to go back. The preset must have been checked first: if not, DropDeck says so. With a small checked library there may be none close enough yet.

### Turning what you see into a playlist

Whatever narrows the list, the library's **+** menu can make **New playlist from these** or **Add these to playlist** with exactly the presets shown, in order.

## Checking presets

DropDeck **checks** every preset on your Mac: it plays it briefly to a test beat, times it, and tags what it looks like. The results drive the tile badges, the filters, the sorts, the hover card and what Auto will play. A preset not measured yet is marked *not checked yet*.

### When the check runs

| Situation | How it runs |
| --- | --- |
| Output on | Gently in the background, for thumbnails and problems. While a preset is live it holds off, unless **Setup › Check presets while live** is ticked (off by default, giving the show the whole Mac). Presets on screen in the library still get thumbnails |
| Output off (STOP OUTPUT) | At full speed, one checker per performance core |
| You ask | **Check…** in the library toolbar: *Check this list* or *Check all presets*. Or right-click a preset › **Check again** |

The status bar shows *Checking 1,204 of 9,800 · about 3 min left* with **pause** and **Stop**. With the output off, PROGRAM shows the same progress. Before a gig, stop the output and let it check the whole library.

### What a check does

Each preset plays to a built-in test beat, first at double speed, then at normal speed, then through a breakdown without drums, and with the drums again. While one preset is being timed it has the machine to itself, so timings are fair. From that run DropDeck measures:

- **Speed** at your output resolution: the time per frame on this Mac.
- **Colours**: how much of the picture each hue takes over the run.
- **Brightness** and how often it dips dark or blacks out.
- **Motion**: zoom, spin and drift, read as tunnel, zoom out, spin, spiral, drift, kaleidoscope, warp or still; plus pace and detail.
- **Beat**: how strongly it follows the kick and hi-hats, and how it changes between drums and breakdown.
- **Flashing**, with a photosensitivity-style flash count.

### Speed badges: heavy and too slow

Two presets play at once during a transition, so each gets a share of the frame budget.

| Badge | Means | What DropDeck does |
| --- | --- | --- |
| *(none)*, smooth | Fits comfortably | Plays at full resolution |
| **heavy** | Over 45% of the frame budget at full resolution | Plays at a lower resolution ("plays at 70%") when *Adaptive resolution* is on. **Avoid heavy presets** keeps it out of Auto |
| **too slow** | Over 90% of the budget even at half resolution | Skipped by Auto; hidden by the *Hide too slow* filter |

A preset can also become heavy live: if it runs slowly on the output, DropDeck says so and marks it.

**Reviewing heavy presets.** *Setup › Library › Review N heavy presets…* lists them with their render scale, frame time and why they were flagged. Tick some (*Tick 100% and above*, *Tick all*, *Tick none*), then **Check N again** to measure them afresh, or **Unflag without checking** to trust them now; they are flagged again if they still struggle.

### Presets that fail

| Health | Meaning |
| --- | --- |
| Fails to load | The visuals engine refused the file |
| Crashed when played | It crashed a checker, the hover preview or the output |
| Froze when played | It hung the renderer |

Failed presets go to **Needs attention** and Auto skips them. If a preset takes the output down, DropDeck names it, won't use it again, and restarts the output.

### Tags

Every checked preset gets these tags:

| Tag | Values |
| --- | --- |
| Colours | Up to three dots on a tile (the strongest), plus a rainbow dot for four or more hues or a preset that runs through the spectrum |
| Brightness | very dark, dark, light |
| Darkness | Stays lit, Dips dark, Blacks out |
| Motion | Tunnel, Zoom out, Spin, Spiral, Drift, Kaleidoscope, Warp, Still |
| Pace | Slow, Medium, Fast |
| Detail | Minimal, Balanced, Busy |
| Beat | Strong beat, Loose beat, Ignores beat |
| Driven by | Bass, Hi-hats, Overall level, Mixed |
| Flashes | No flashes, Some flashes, Strong flashes (shown as an amber or red bolt, and ⚠ on the phone) |
| Textures | A slashed-picture mark when a texture the preset needs is missing |

DropDeck shows only what the tags hold; it never guesses.

### Three stages: check, Preview, live

After the check, each preset is **watched** twice more for about eight seconds, once each, while music plays and nothing is laid over it:

1. **In Preview**, once it has waited there about six seconds (a preset's first seconds aren't its usual look). It needs Preview drawing at least 24 pictures a second, which the default half-rate Preview does at a 60 fps output, and no look changes or picture-altering effects.
2. **Live**, with no transition, strobe, overlays or pads. Live has the last word.

A small **heartbeat** beside the icons under PREVIEW or PROGRAM shows a watch is running.

- **Colours are pooled** from the check and every watch, so a slowly cycling preset shows every colour it passes through. Every colour with a real share counts for the colour filter; four or more hues make it a rainbow.
- For brightness, darkness and flashing, the check stays the reference. A watch overrides it only when it clearly disagrees (the far side of dark or light, clearly more flashing, or going dark), and a watch never takes a warning away.
- What Preview saw stands until the preset has been live; live is then judged against the check, not Preview.
- Motion and beat tags always stay the check's.
- A preset the check never measured gets its colours, brightness and flashing from the watches.

The hover card's SOURCE row says where the tags came from: quick check, older check, watched in Preview, watched live, refined in Preview and live, and whether any were corrected by hand.

### The hover card

Rest the mouse on the icons under PREVIEW or PROGRAM. They spread open into rows: LOOK, MOTION, MUSIC and the warnings first, then SPEED, FILE, PLAYED, NOTE, TAGS, PACK and SOURCE. When there is more than fits, it pans along, and it folds away a moment after you move off.

### The Info tab

Select a preset and press **I** (or right-click › Tags › More tags…) to see everything about it in the side panel's **Info** tab:

- **Cue**, **Take now**, **Favourite** and **Check again** buttons.
- **Your tags**: toggle them, or type a **New tag** and click **Add**.
- **Tags**: Brightness, Motion, Pace, Detail, Beat, Driven by, Flashes and Darkness, each a dropdown. Pick a value to correct a tag; it sticks. *As measured* undoes it, and **Undo all corrections** undoes them all.
- **Measurements**: the raw numbers behind the tags.
- **Speed on this Mac**, **File** (with its textures, and any that are missing), and **Played** (plays, holds, pulled early, last played).
- **Quick tags**: the numbered tags you reach from the right-click menu, the phone and MIDI.

### Skip in Auto, and warnings

- **Skip in Auto** (right-click a preset, or the menu on PROGRAM) keeps a preset out of Auto without deleting it. It moves to *Needs attention*. **Allow in Auto** brings it back.
- **Clear warning** clears a preset's skip, heavy mark and failure, so Auto tries it again.

## Beat sync and the Audio tab

DropDeck listens to the music, finds the tempo and Beat 1 of every bar, and times takes, Auto, beat effects, overlay motion and FX to that grid. You set up the input and the tempo in the side panel's **Audio** tab, and steer the beat live from the top bar.

### Choosing the input

| Input | Use it for |
| --- | --- |
| Default input (named) | The Mac's current input: the built-in microphone, a USB interface, a mixer feed |
| A named device | Any other input device the Mac has |
| This Mac's audio | Whatever is playing on this Mac (Spotify, a DJ app, a browser), with no extra driver. Needs macOS 14.2 or later; macOS asks once for permission. On older macOS use a loopback driver such as BlackHole |
| Test beat | A built-in beat at **Test BPM** (70 to 180, default 124), for trying things without music |
| Off | No audio |

Below the input: **Level** (dBFS), an **Onsets** light that flashes on each hit, and **Bass**, **Mid** and **Treble** meters. **Gain** boosts or cuts the input before analysis and visuals (−24 to +24 dB). **Audio reaction** sets how strongly presets react to the music (0 to 4, default 1).

If only silence arrives, DropDeck says where to grant permission: *Microphone* for an input, *Screen & System Audio Recording* for This Mac's audio (both under System Settings › Privacy & Security). If an input stops, it reconnects by itself.

### Tempo

| Control | What it does | Default |
| --- | --- | --- |
| Detect BPM | On: the tempo comes from the music. Off: use the tempo you set or tap | On |
| BPM | The tempo, with the detection's confidence; set it by hand when Detect BPM is off (60 to 200) | 120 |
| Range | The expected tempo range: 70–140, 85–170 or 100–200. Stops 87 BPM reading as 174; use 100–200 for drum & bass | 85–170 |
| Beats / bar | 3, 4 or 6 | 4 |
| Bars / phrase | 4, 8, 16 or 32 | 8 |

### Steering the beat live

The top bar shows the BPM and its state: *listening*, *detecting*, *locked*, *tapped*, *manual* or *no audio*. Beside it, the beat lights count the bar and *bar 3/8* counts the phrase.

- **TAP** (or **T**): tap along on the beat. Each tap marks a beat; the tempo is the middle of your last few taps, and a pause over 2 seconds starts afresh. A tapped tempo holds for 20 seconds before detection may move it.
- **½** and **×2**: halve or double the tempo when detection lands an octave off.
- **Beat 1** (or **1**): press on the first beat of a bar. Until you do, DropDeck guesses Beat 1 from bass accents.
- **⟳ Re-detect**: forgets the tempo and listens afresh, after the music changes. It locks again about 6 seconds later. It turns Detect BPM back on if it was off.

### Sync with the projector

Projectors and TVs add their own delay, so a flash can land after the beat you hear.

- **Sync test** makes the output flash and the Mac click on every beat. Raise **Sync offset** until they land together.
- **Sync offset** fires beat effects earlier (−150 to +250 ms) to make up for display delay.
- **Nudge** (−10 ms / +10 ms) moves the beat grid earlier or later when the detected beat sits slightly off.

### Spectrum

The Audio tab ends with a spectrum of the input. The status bar's AUDIO readout shows the same in stereo: 56 bands per channel from 20 Hz to 20 kHz, left above and right below.

### How the beat tracker works

The tracker finds onsets (sudden rises in the spectrum), scores candidate tempos against them, and follows the winner with a phase-locked loop. The beat moves to other onsets only on several beats of evidence or for new music, so fills and syncopation can't throw it. *Cut on the drop* and *Match the music* in Auto also use it to notice breakdowns and when the bass returns.

## Auto

**Auto** is DropDeck's auto-pilot: it keeps the next preset waiting in Preview and takes it on the beat every so many beats, bars or phrases. Switch it on with **MANUAL | AUTO** in the top bar, or press **A**. Its settings live in the side panel's **Auto** tab.

### How Auto runs

1. It picks the next preset from its list and cues it into Preview (the top bar says *Preparing next…*).
2. It waits until that preset has shown it renders fast enough in Preview (*Checking next…*). With *Blackouts* kept out, it also waits for a picture: nothing goes live while Preview is black.
3. When the live preset has been on for the hold time, it takes Preview on the next bar or phrase line (*Mixing…*). The top bar counts down meanwhile: *Next in 12 beats*.
4. If Preview wasn't ready in time, it waits for the next bar rather than firing off the beat.

At the start of a show, with nothing live, it takes straight away. With the output off, Auto pauses.

- **Click a preset** while Auto is on to choose what's next; Auto takes it at the usual time.
- **Cue another** picks a different preset for Preview.
- **HOLD** (or **H**) keeps what's live: Auto leaves it until you release it. The next preset still gets ready in Preview, and the top bar says *Held*.
- TAKE and CUT still work any time.

### The Auto tab

| Setting | What it does | Default |
| --- | --- | --- |
| Change every | How long each preset stays: a number of beats, bars, phrases or seconds | 8 bars |
| Without a beat | How long each preset stays when there's no steady beat | 30 s |
| Order | Shuffle, Random, In order or Flow (below) | Shuffle |
| From | Browser view, All presets, Favourites or Cue list | Browser view |
| Random transitions | On: each take uses a transition picked from a set you tick. Off: uses the transition chosen between the monitors | Off (set: Morph, Plasma, Circle, Sweep, Zoom blur, Warp, Luma burn) |
| Cut on the drop | Changes on the beat when the bass returns, if the live preset has been on at least 4 seconds. Its tip counts drops so far | Off |
| Avoid heavy presets | Skips presets too slow for this Mac | On |
| Match the music | Calm presets in breakdowns, punchy ones (strong on the beat, or fast) around drops | Off |
| Keep out of Auto | Flashing, Missing textures, Blackouts (black or nearly black presets, and any that stay black in Preview) | All off |

**Browser view** means Auto plays whatever the library shows: a folder, a playlist, a search, Favourites, Preset Filters or a saved look. Change the library and Auto follows.

### Order

| Order | How it picks |
| --- | --- |
| Shuffle | Every preset once, in a random order |
| Random | Any preset, any time, but not one played lately |
| In order | Down the list, one after another |
| Flow | Presets close in look and energy to the last one, with no repeats until all have played |

**Flow** works like a DJ blending tracks into a set. Each pick looks and feels close to the preset before it: colours, brightness, movement, and how much it changes, flickers and follows the beat. It picks among the four nearest, the nearest likeliest, so it still varies. No preset repeats until every preset Auto can play has played; then a new pass begins. *Match the music* still counts in Flow.

### What Auto never plays

- Presets marked **Skip in Auto**, and presets that failed to load, crashed or froze.
- **too slow** presets; **heavy** ones too while *Avoid heavy presets* is on.
- Whatever *Keep out of Auto* names.
- A preset that stays black in Preview, when Blackouts are kept out (DropDeck says it skipped it).

If nothing is left to play, DropDeck says so: pick another list or allow skipped presets.

## Overlays and pads

**Layers** put a logo, image, animated GIF or text over the visuals, always on or repeating now and then. **Pads** pop a picture on screen when you fire them and let the preset melt it away. Both are set up in the side panel's **Overlays** tab; pads are fired from **PADS & FX** at the top of the panel.

### Layers

- **+ Image / GIF…** adds a PNG or JPEG (transparency works) or an animated GIF.
- **+ Text** adds a text layer (it starts as DROPDECK).
- **Overlays: ON / OFF** shows or hides every layer at once. Pads still work.

The **Layers** list shows each layer with its kind (IMG, GIF or T), a show/hide eye, move up and down, and delete. The top of the list draws last, so it sits on top. Click a layer to edit it. On PROGRAM, drag a layer to move it and pinch to resize it.

### Editing a layer or a pad

The editor runs in the order you think of it: what it is, when it shows, where it sits, how it looks, how it moves.

| Part | Settings |
| --- | --- |
| What it is | **Name**. For text: the words, **System font**, **Colour**, **Outline**, **Shadow**, **Outline width**, and **Left**, **Centre** or **Right**. For a picture: **Replace image…** |
| Showing | A layer is **Always on** or **Repeating** (shown for a moment every so often, with **Show now** to show it once and restart the count). A pad has **Hold**, **Fade**, **Melt** and **Grow**, and its repeat |
| Placement | **Across**, **Down**, **Size** (height as a share of the screen) and **Rotation**, with quick spots: Top left, Top right, Bottom left, Bottom right, Fill screen |
| Look | **Opacity**, **Blend**, **Melt** strength, **Preset colours**, **Outline** and **Outline colour** |
| Motion | A motion, its **Amount** and **Rate** (cycles per bar, so it follows the BPM), the **Motion area** (Whole screen, Half screen, Small, or drag the dashed box's corners on PROGRAM), and **Beat bump**, a size punch on every beat |
| Colour | **Layer colour** or **Pad colour**: marks it in the lists. It doesn't change the picture |

**Duplicate layer** makes a copy ("Logo copy").

### Blends

| Blend | Effect |
| --- | --- |
| Normal | Drawn on top, as is |
| Add | Brightens: black disappears and colours glow |
| Screen | Like Add, but never blows out to white |
| Multiply | Tints and darkens; white has no effect |
| Overlay | Boosts contrast: light parts lighten, dark parts darken |
| Difference | Subtracts colours: white inverts, black changes nothing |
| Invert | Inverts the colours inside the layer's shape |
| Cut-out | Black outside the layer's shape; the preset plays inside it |
| Melt only | Melted into the preset, whose motion warps and smears it |
| On top + melt | On top and melting in at once |

**Melt** is DropDeck's own trick: the layer is drawn into the preset's feedback picture, so the preset's own motion carries and smears it. **Preset colours** melts the layer in using the live preset's colours, so a white logo doesn't white out the picture. Some blends work on top only and melt in as Normal; the editor says so. **Outline** draws a line around the shape so it stands out from busy or matching colours.

### Motions

Still, Pulse, Spin, Float, Bounce, Wobble, Orbit, Blink on beat, Wander and Ricochet.

### Pads

There are eight pads. Click a pad to fire it: its picture pops on screen, stays crisp for its **Hold** (up to 20 seconds), then the preset melts it away as it lets go. Click an empty pad to load a picture or text.

| Pad setting | What it does |
| --- | --- |
| Hold | How long it stays crisp on top before it starts to melt |
| Fade | How long the crisp copy takes to fade away |
| Melt | How strongly it melts into the preset; 0 = on top only |
| Grow | Zooms it up a little while it shows |
| On top for | With *On top + melt*: the share of the hold the crisp top copy shows, while it melts in for the whole hold |

The pad editor has **FIRE** to try it on the output, **Image…** and **Text** to change what it shows (new text pads start as DROP!), and **Clear** to empty it.

**Repeat.** Tick **Fire by itself** and set **Every** to fire a pad on a timer. Type a time too: 5 means five minutes, 90 s, or 2:30; double-click to reset. A countdown shows on the pad (⟳ 1:20), and firing it by hand restarts the count. Repeats wait while the output is off.

Right-click a pad in PADS & FX for **Edit…**, **Image…**, **Text**, **Repeat every …** / **Stop repeating**, and **Clear pad**.

### Pad and layer colours

Each pad or layer can be marked with a colour of its own so you can find it quickly. Pads use Violet, Magenta, Cyan, Mint, Acid, Amber, Ember and Blue; layers use Orchid, Rose, Ice, Teal, Jade, Gold, Coral and Steel. The colour marks it in the lists only.

### What the audience doesn't see

Preview never shows overlays, pads, strobe or blackout: only PROGRAM does.

## FX

Eight **FX buttons** in PADS & FX change the whole picture for as long as you want: tap to latch one on, hold it for a moment, and right-click to set it up. **All FX off** clears them.

### The eight effects

| FX | What it does | Amount (default) |
| --- | --- | --- |
| STROBE | White flashes on the beat | Per beat: ½ to 4 (2) |
| HUE | Cycles the colours in time with the music | Per bar: 0.05 to 4 (0.5) |
| INVERT | Inverts the colours | — |
| MIRROR L\|R | Mirrors the left half onto the right | — |
| MIRROR T\|B | Mirrors the top half onto the bottom | — |
| QUAD | Mirrors into four quarters | — |
| KALEIDO | Mirrors into segments | Segments: 3 to 16 (6) |
| PRISM | Six facets with rainbow edges, pulsing on the beat | Strength: 5% to 100% (50%) |

Out of the box the eight buttons hold these eight effects, in this order. Several can run at once; where two set the same thing (two mirrors, say), the one pressed last wins.

### Setting up a button

Right-click an FX button to choose:

- **Which effect** it runs (any button can run any effect).
- **Its amount**, where the effect has one.
- **How it plays**:

| Mode | Behaviour |
| --- | --- |
| Tap or hold | Tap: on and off. Hold: on while held (default) |
| Toggle | Click: on and off |
| Hold only | On while held |

The set-up for Strobe carries a warning: strobing can affect people with photosensitive epilepsy. The same goes for **Downbeat flash** in the Display tab.

### FX from elsewhere

- **MIDI**: each FX button, *Next mirror* and *All FX off* can be mapped.
- **Phone remote**: the FX buttons, and their set-up, are on the phone too.

## Display tab

The **Display** tab adjusts the whole picture on the output, whatever preset is playing: freeze it, slow it down, zoom in, change its colours, and add beat effects. Every slider resets to its default on a double-click, and **Reset** puts the whole tab back (the master level stays as it is).

| Group | Setting | What it does | Range (default) |
| --- | --- | --- | --- |
| Freeze and fade | Freeze | Holds the current frame | On / off (off) |
|  | Blackout fade | How long Blackout (FADE, B) takes | 0 to 10 s (1 s) |
| Motion | Speed | How fast presets move. It really slows presets down or speeds them up, not just the frame rate | 0.1× to 3× (1×) |
|  | Zoom | Crops into the centre | 1× to 3× (1×) |
| Colour | Brightness | Lifts or lowers the picture | −0.5 to +0.5 (0) |
|  | Contrast |  | 0.3 to 2 (1) |
|  | Saturation | 0 = black and white | 0 to 2 (1) |
|  | Hue shift | Rotates all colours | 0 to 1 turn (0) |
|  | Hue cycle | Rotates colours continuously, in turns per bar | 0 to 1 per bar (0) |
| Beat effects | Beat pulse | A small zoom and brightness punch on every beat | 0 to 1 (0) |
|  | Downbeat flash | A white flash on Beat 1. Can affect people with photosensitive epilepsy | 0 to 1 (0) |

Freeze can be mapped to a MIDI button, and every slider to a knob or fader. Beat effects fire early by the **Sync offset** set in the Audio tab, so they land with the picture on a slow projector.

## Output and the Setup tab

The output is the full-screen picture on your second display. DropDeck finds an HDMI or other external display by itself and goes full screen there; with one display, the output plays in a window. The side panel's **Setup** tab holds where the output goes, its quality, the monitors, the library and the app's own options.

### Starting and stopping the output

- **STOP OUTPUT** (top right) turns the output off (it asks first while something is live). The audience sees black until you start it again. Meanwhile presets check at full speed, clicking a preset auditions it in Preview, and Auto pauses.
- **START OUTPUT** turns it back on.
- **Esc** on the output window turns full screen back into a window; pick a display in Setup to go full screen again.
- **Test pattern** shows colour bars and a grid for lining up a projector.

### Output display

A light and a few words at the top say where the output is: *Output off*, *Starting…*, the display's name, or *In a window*, with the size and frame rate. The dropdown picks:

| Choice | Output goes |
| --- | --- |
| Automatic | Full screen on an external display when one is plugged in; otherwise a window (default) |
| A display by name | Full screen on that display (the list shows size and refresh rate, and marks the built-in and the controls' own screen) |
| Window | Always a window |

When the output is in a window on the same screen as the controls, it sits behind them, also when the controls are full screen. Tick **Keep output on top** to put it in front.

### Quality

| Setting | What it does | Default |
| --- | --- | --- |
| Resolution | Match display, 540p, 720p, 1080p, 1440p or 4K. Lower runs cooler | 1080p |
| Render scale | 50% to 150%. Lower it if presets can't keep up; above 100% sharpens simple ones | 100% |
| Adaptive resolution | Heavy presets drop resolution instead of stuttering | On |
| FPS cap | 24, 30, 50, 60, 120 or Max. 30 halves the load | 60 |
| Warp detail | Light, Normal, Fine or Ultra: how finely presets warp the picture. Finer is smoother but uses more CPU | Normal |

### Monitors

| Setting | What it does | Default |
| --- | --- | --- |
| Half-rate Preview | Preview renders at half the output rate, to save power | On |
| Monitor fps | 15, 30 or 60: how often PREVIEW and PROGRAM refresh on the controls. The output isn't affected | 30 |
| Preview on hover | Library thumbnails play live under the mouse | On |

### Library

- **Check presets while live**: lets the background check run while a preset is live. Off gives the show the whole Mac (default off).
- **Review N heavy presets…**: opens the heavy presets report (see [Checking presets](#checking-presets)).
- **Texture folders**: where presets find their pictures. Your library's packs and the texture pack inside the app are searched already. **+ Add texture folder…** adds another; × stops looking in one. A preset with a missing texture shows the slashed-picture mark, and its Info lists what's missing.

### App

| Setting | What it does | Default |
| --- | --- | --- |
| Animations | Smooth motion for buttons, menus and panels. The Mac's *Reduce motion* setting is followed too | On |
| Start in full screen | Opens the controls in full screen at launch. Leaving full screen later doesn't change it | Off |
| Typeface | Electrolize with Space Mono (DropDeck's own look), or System, the Mac's own fonts | Electrolize |
| Show the welcome screen | Opens the welcome screen again |  |

### Full screen controls

The arrows at the right of the status bar, or **⌃⌘F**, fill the screen with the controls and back.

### Tips for a MacBook Air

The Air has no fan, so it slows down when it gets hot.

- Watch **HEAT** in the status bar. If it turns amber or red, lower the resolution (1080p or 720p) or set **FPS cap** to 30.
- Leave **Half-rate Preview**, **Adaptive resolution** and **Avoid heavy presets** on.
- Before a gig, stop the output and let DropDeck check the whole library, then set the speed filter to **Smooth only** for a set that never struggles.

## Control tab: phone remote and MIDI

The side panel's **Control** tab connects two ways to run the show without the mouse: a **phone remote** in your phone's browser over Wi-Fi, and **MIDI** controllers over USB or Bluetooth.

### Phone remote

The remote is a web page DropDeck serves to phones on the same Wi-Fi. It is off until you switch it on, and it needs no app.

1. In **Control › Phone remote**, switch **Phone remote on**.
2. Scan the QR code with your phone's camera. The link carries an 8-letter **pairing code**, so the phone is paired at once.
3. Or open the address shown on the phone and type the code.
4. If macOS asks whether DropDeck can accept incoming connections, click **Allow**.

The tab shows how many phones are connected. **New code** makes a fresh pairing code; phones paired with the old one have to scan again. With no network, it asks you to connect the Mac to Wi-Fi. The remote works in portrait only, so nothing gets pressed by accident.

**What the phone can do**

| Phone tab | Controls |
| --- | --- |
| LIVE | The live preset with its tags, what's Next, **Take**, **Cut**, **Hold**, **Blackout**, **Tap**, **Beat 1**, **Master**, **Auto** on and off, and the audio level. Start output when it's off |
| SET | The preset browser: All, Faves, Cue list or Recent, in name order or shuffled (Shuffle again), with Preset Filters. Tap to cue, tap three times to take, hold for info and tags. If Auto plays from another list, it offers *Play this set* |
| FX | The eight FX buttons, with their set-up (effect, mode, amount) behind *Edit button*, and All off |
| PADS | The pads: tap one to fire it |
| STATS | Frame rate, frame time, stutters, CPU, heat, render size, audio to output delay, audio input, running time and what's connected |

Tap the **BPM** at the top for *Tempo & audio*: Tap, ½×, 2×, Beat 1, ⟳ Re-detect, Nudge ±10 ms, Detect BPM with manual ±1 and ±0.1 steps, and the Mac's audio **Gain**. The phone can also skip the live preset in Auto and stop the output, each after asking.

On the phone, the waiting preset is called **Next** (Preview on the Mac), and Favourites are **Faves**.

### MIDI

DropDeck listens to every MIDI controller connected over USB or Bluetooth; one appears in a few seconds. You map controls to actions with **MIDI learn**.

- **Use MIDI controllers** turns MIDI on or off.
- **Soft takeover**: a fader takes over only once it reaches the current value, so nothing jumps.
- **Controllers** lists what's connected, with the last message received.

**Mapping a control**

1. In **Mappings**, click **Learn** beside an action.
2. Touch a control: press a button or pad for an action, or move a knob or fader for a slider.
3. It's mapped (MIDI: TAKE → your controller). Click × to remove one, or **Clear all mappings**.

Shortcut: right-click TAKE, CUT, HOLD or FAVOURITE on the console and choose **Learn MIDI shortcut…**. Its mapped control then shows on the button.

**What can be mapped**

| Group | Actions |
| --- | --- |
| Transport | TAKE, CUT, T-bar, Cancel take, Hold what's live, Cue next, Cue previous, Cue random, Auto: cue another, Manual / Auto, Next transition, Previous transition, Transition length |
| Output | Master, Blackout, Blackout fade, Freeze, Render scale, Stop / start output |
| Tempo | Tap tempo, Beat 1, Halve tempo, Double tempo, Re-detect |
| Display | Speed, Brightness, Contrast, Saturation, Hue shift, Hue cycle, Zoom, Beat pulse, Downbeat flash, Next mirror, Audio reaction, Input gain |
| Library | Favourite what's live, Skip what's live in Auto, Quick tag 1 to 4, Saved look 1 to 4 |
| Pads | Pad 1 to Pad 8 |
| FX | FX button 1 to 8, All FX off |
| Overlays | All overlays, and Overlay 1 to 4 on and off and their opacity |

The status bar's MIDI light flashes when messages arrive; its tip names the last one.

## Performance panel and messages

The **Performance** panel has the live numbers behind the status bar: frame rate, stutters, frame times, CPU, memory, heat and the chip's temperature. Open it by clicking the engine light, FPS, FRAME, CPU or HEAT in the status bar; click again to close it.

### What it shows

| Readout | Meaning |
| --- | --- |
| Visual frame rate | Pictures per second the audience sees, against the target, with the output rate and the worst frame. Below the output rate, the preset itself is too slow |
| Stutters | Times the picture froze, in total and in the last minute. Five in a minute turn the status light yellow |
| Dropped frames | Output frames that missed their slot |
| Audio → output | The delay from sound in to picture out, inside the Mac. Your display adds its own |
| Time per frame | Live, Preview and Mixer rows with frame time, worst, fps and size, against a budget line. Hover a row for its CPU and GPU parts |
| Output CPU / RAM, Controls CPU / RAM | What the output and the controls each use (100% = one core) |
| Heat | How hard the Mac works to stay cool. Hot means it slows down |
| Chip temperature | The average of the chip's sensors, the hottest now, the hottest since start, and the battery, with a graph of the last 5 minutes |
| Render size | The live preset's render size |
| Running for | How long the output has run, and how many restarts |
| Library | How many presets you have |
| Renderer | The graphics renderer, OpenGL and projectM versions |
| Recent events | Restarts and other events, newest first |

**Open log folder** opens `~/Library/Logs/DropDeck/` in Finder. If the output restarted several times, the panel says it is in safe mode.

### Messages

Messages appear at the right of the status bar, taking turns and sliding in from below; a count shows how many are waiting. Each says what happened, then what to do: *Pad 3 is empty: load a picture in the Overlays tab.* Click the messages, or the list icon at the right, to see recent ones newest first, with repeats counted (×3). **Clear** empties the list; Esc or a click elsewhere closes it.

### Rolling numbers and words

Numbers, words and icons that change while you watch roll into place like a departures board or an old roller counter. Going up, digits roll downward; going down, they roll upward; higher digits lag a beat behind; and a number that changes all the time just keeps rolling, read a few times a second so you can follow it. Turn the console's animations off in **Setup › App › Animations**.

## Keyboard shortcuts

Press **?** in DropDeck to see these in the help window, *How DropDeck works*. Single-letter keys work whenever you aren't typing in a field.

| Key | Action |
| --- | --- |
| **Play** |  |
| Space | TAKE: send Preview live (press again to finish a take now) |
| X | CUT: switch instantly |
| B | Blackout: fade to black; press again to fade back |
| H | Hold: keep what's live, so Auto leaves it |
| F | Favourite what's live |
| **Browse** |  |
| ← ↑ ↓ → | Move through presets |
| Return | Cue the selected preset |
| I | Info on the selected preset, or the one under the mouse |
| S | Favourite the selected preset |
| ⌘F | Search presets |
| Esc | Clear the search, or close the help |
| **Tempo and Auto** |  |
| A | Switch between Manual and Auto |
| T | Tap tempo |
| 1 | Beat 1 |
| **Window** |  |
| ⌃⌘F | Full screen controls |
| ? | Help and shortcuts |
| ⌘Q | Quit (asks first while the output is live) |
| Esc on the output | Turn the full-screen output back into a window |

### With the mouse

| Do this | To |
| --- | --- |
| Click a preset | Cue it |
| Double-click a preset | Cue it and send it live |
| Double-click PROGRAM | Find the live preset in the library |
| Drag the T-bar | Fade by hand |
| Pinch on the library | Resize thumbnails |
| Drag a layer on PROGRAM | Move it; pinch to resize it |
| Double-click a slider | Reset it |
| Double-click MASTER | Full level |
| Right-click TAKE, CUT, HOLD or FAVOURITE | Learn a MIDI shortcut |
| Right-click a pad or FX button | Edit or set it up |

## Files, data and logs

Everything DropDeck keeps lives in four places in your user Library. Back up the Application Support folder to keep your presets, tags, favourites and settings.

| What | Where |
| --- | --- |
| Settings: output, look, Auto, audio, the cue list, playlists, saved looks, overlays, pads, FX buttons, MIDI mappings and the phone remote | `~/Library/Application Support/DropDeck/settings.json` |
| Favourites, your tags, tag corrections, play counts, holds and speed results | `~/Library/Application Support/DropDeck/library.sqlite` |
| Imported presets, a folder per pack | `~/Library/Application Support/DropDeck/Presets/` |
| Their textures, a folder per pack | `~/Library/Application Support/DropDeck/Textures/` |
| Thumbnails | `~/Library/Caches/DropDeck/thumbs/` |
| Logs | `~/Library/Logs/DropDeck/` |

- Right-click a pack › **Reveal in Finder** to open its folder.
- The Performance panel's **Open log folder** opens the logs. Numbers and technical detail go to the log rather than to on-screen messages, so the log is the place to look when something goes wrong.
- Each preset's record is keyed by a fingerprint of the file's contents, which also names its thumbnail. Renaming or moving a preset file keeps its details; editing it keeps your own data but measures it again.
- The database is written every couple of seconds, only the rows that changed.
- Upgrading from an older DropDeck converts the old `presets.json` and keeps it as `presets-before-sqlite.json`; an even older file is kept as `presets-v1-backup.json`.
- Thumbnails are a cache: DropDeck makes them again if they go.

The app itself never downloads anything. The phone remote is off until you switch it on, and only phones on the same network with the pairing code can use it.

## Troubleshooting

Most problems show up as a message in the status bar that says what happened and what to do; the log folder has the detail. These are the common ones.

### Installing and starting

| Problem | Fix |
| --- | --- |
| macOS won't open DropDeck the first time | It isn't notarised yet. System Settings › Privacy & Security › **Open Anyway** (or Control-click › Open on macOS 13 and 14) |
| *The output can't start: this Mac has no graphics DropDeck can use* | Usually a virtual machine. Run DropDeck on the Mac itself |
| The welcome screen keeps opening | Tick **Don't show this again** |

### Sound and beat

| Problem | Fix |
| --- | --- |
| *Only silence is arriving* (microphone or input) | Allow microphone access in System Settings › Privacy & Security › Microphone |
| *Only silence is arriving* (This Mac's audio) | Allow DropDeck in System Settings › Privacy & Security › Screen & System Audio Recording |
| This Mac's audio is greyed out | It needs macOS 14.2 or later. Use a loopback driver such as BlackHole instead |
| *Audio input stopped; reconnecting…* | DropDeck reconnects by itself. Check the cable or interface if it keeps happening |
| The tempo is double or half | Press **½** or **×2**, or set **Range** (100–200 for drum & bass) |
| The bars start on the wrong beat | Press **Beat 1** (or 1) on the first beat of a bar |
| The music changed and the beat is lost | Press **⟳ Re-detect**; it locks again in about 6 seconds |
| Flashes land after the beat on the projector | Turn on **Sync test** and raise **Sync offset** until flash and click land together |

### Picture and performance

| Problem | Fix |
| --- | --- |
| The picture stutters; the status light is yellow | Lower **Resolution** or **Render scale**, set **FPS cap** to 30, leave **Adaptive resolution** on, and check HEAT |
| HEAT is amber or red | The Mac is slowing to stay cool. Lower the resolution (1080p or 720p) or the FPS cap |
| A preset is marked heavy or too slow | Expected on a busy preset. Review them in Setup › Library › Review heavy presets, or use the *Smooth only* filter |
| A preset shows a missing-texture mark | Add the folder with its pictures in **Setup › Texture folders** |
| A preset stays black | With *Blackouts* kept out of Auto, Auto skips it. Otherwise it may simply be dark: check its Info |
| The output is in a window on the controls' screen | Esc on the output turned it into a window, or there's only one display. Pick a display in Setup, or tick **Keep output on top** |

### Crashes and recovery

- If a preset crashes or freezes the output, the output restarts within about a second (or after a 4-second hang). DropDeck names the preset and won't use it again.
- Three crashes in a minute put the output in **safe mode**: black, with nothing loaded. Cue another preset to carry on.
- If the controls themselves hit an internal error, they recover and keep going; details go to the log.
- Every helper process quits if the controls go away, so nothing is left running.

### Library and import

| Problem | Fix |
| --- | --- |
| *Files only stored online* | Download them in Finder (iCloud Drive, OneDrive), then import again |
| An import skipped presets you deleted before | Tick **Bring them back** |
| *Find similar looks* says the preset isn't checked | Check it first (right-click › Check again), then try again |
| *Auto has nothing to play* | Pick another list in the library or Auto's *From*, or allow skipped presets |
| A preset vanished from Auto | It may be skipped, heavy or flagged: look in **Needs attention** |

### Phone and MIDI

| Problem | Fix |
| --- | --- |
| The phone can't connect | Put both on the same Wi-Fi, click Allow if macOS asks about incoming connections, and scan the QR code again |
| *That code didn't work* | Type the 8-character code shown in Control › Phone remote, or make a **New code** |
| A MIDI controller doesn't appear | Plug it in over USB or Bluetooth and wait a few seconds; check **Use MIDI controllers** is on |
| A fader does nothing at first | Soft takeover is on: move it past the current value |

## Licences

DropDeck is free to download and use; its source code isn't public. The visuals engine, libprojectM, is under the LGPL-2.1 and each release carries its full source with DropDeck's changes. The fonts, icons and texture pack are listed with their licences in the [README](README.md#licences).

## Glossary

DropDeck uses one name for each thing, on the Mac and on the phone.

| Term | Meaning |
| --- | --- |
| Auto | The auto-pilot that picks and takes presets on the beat |
| Beat 1 | The first beat of the bar |
| Blackout | A fade to black and back (FADE, B) |
| Check | DropDeck playing a preset briefly to time it and tag it. *Check again* measures it afresh |
| Colour (pad or layer) | A marker colour that helps you find a pad or layer in the lists; it doesn't change the picture |
| Control (tab) | The phone remote and MIDI |
| Cue | To put a preset in Preview. The *cue list* is your running order |
| CUT | An instant change, still on the beat |
| Display (tab) | Brightness, zoom, colour and beat effects |
| Faves | Favourites, on the phone |
| Favourites | Starred presets |
| Flow | Auto's order that picks presets close in look and energy to the last one |
| Full screen | Filling the screen, with the controls or the output |
| Heavy | Plays at a lower resolution to keep up |
| HOLD | Keeps what's live so Auto leaves it alone |
| Live | What the audience sees right now |
| Look | A saved set of Preset Filters |
| Melt | Drawing a layer or pad into the preset itself, so its motion smears it (blends: *Melt only*, *On top + melt*) |
| Next | Preview, on the phone |
| Not checked yet | Not measured yet |
| Output | The full-screen picture on the second display; *Stop output* / *Start output*, and the state *Output off* |
| Pad | One of eight buttons that pop a picture on screen |
| Performance | The panel with frame rate, load and heat |
| Preset | One MilkDrop visual; *visuals* means the whole picture |
| Preset Filters | The filter that narrows the library |
| Preview | The monitor where the waiting preset plays, seen only by you |
| PROGRAM | The live monitor's title |
| Re-detect | Finding the tempo again |
| Repeating | A layer that shows for a moment every so often (against *Always on*); *Show now* shows it once |
| Setup (tab) | The output, quality, library and app options |
| Similar looks | Presets that look alike (*Find similar looks*) |
| Skip in Auto / Allow in Auto | Keeping a preset out of Auto, or letting it back |
| Strong beat, Loose beat, Ignores beat | How a preset follows the beat. *On the beat* means loose or strong |
| TAKE | Sending Preview live with a transition |
| Too slow | Can't keep up even at a lower resolution; skipped |
