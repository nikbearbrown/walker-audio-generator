# Walker — Audio Generator

**What this is.** An independent, title-only adaptation of the Godot demo `audio/generator` (source commit `a3b5c113112f77291d5f3d1360f33a882fdc52f7`), kept in Walker as a tech demo, not a game. GDScript synthesizes a stereo sine wave sample by sample (`push_frame`) at 22050 Hz, starting at 440 Hz; two sliders change its frequency and volume. There are no audio files in the project.

**Why it is in Walker.** It is the source for two planned native-4K Liam films about generating audio from code. Both films remain pending.

**What was found and verified.** Import and 15 headless input/state assertions pass (and passed again in a 2026-09-26 regression run). Ordinary runtime exits 0 but reports one ObjectDB leak at shutdown; a verbose run identifies it as an `AudioStreamGeneratorPlayback` left on abrupt exit. An orderly stop-and-drain restart test passes three cycles with a clean shutdown; no production shutdown fix is claimed. Actual audible pitch, waveform quality, underruns/latency, visual inspection and both native 4K Liam films remain pending. See FRICTIONAL.md.

## How to run

Open `godot/project.godot` in Godot 4.7 and run the main scene (`generator.tscn`). The tone starts immediately; there is no stop control, so lower the volume or close the window to stop it.

Controls (mouse, or keyboard on a focused slider: arrow keys, Home, End):

- **Generated Audio Frequency** slider: 100–1000 Hz.
- **Playback Volume** slider: shown in dB.

The project defines no custom input actions.

## Design

- [GDD.md](GDD.md): recovered game design document, every claim tagged `[OBSERVED]`, `[INFERRED]` or `[MISSING]`. It is a recovered, unapproved description, not an approved design; no design gate is signed.
- [design/DECK.html](design/DECK.html): slide deck of the recovered GDD.
- [design/IMPLEMENTATION-MAP.md](design/IMPLEMENTATION-MAP.md): features mapped to scene, script and line.
- [design/decisions.md](design/decisions.md): open questions, including how captures should handle the shutdown leak.

## Source & license

Original source, assets, UIDs and README preserved, with the upstream MIT license (Godot Engine contributors) in LICENSE.md. Test harness added locally; no source checkout changes. No external audio assets are used: the script synthesizes the sound.

## Status

- Headless state checks pass; the abrupt-exit leak is a known limitation, not repaired.
- Heard pitch, waveform, underruns/latency, visual inspection and both films are pending.
- Repository: https://github.com/nikbearbrown/walker-audio-generator
