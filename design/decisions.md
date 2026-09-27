# Open questions log — walker-audio-generator

Recovered by `/gdd reverse --path godot silent`, 2026-09-27. gate — unsigned at time of writing.
Format: THE QUESTION / THE STAKES / DECISION DEADLINE / OPTIONS / OWNER / STATUS. Every `[MISSING]` item in `GDD.md` lands here.

| # | Question | Stakes | Deadline | Options | Owner | Status |
|---|---|---|---|---|---|---|
| Q-01 | Is this a lesson about synthesis (what a sine wave is) or about the engine API (how the buffer is filled)? | Decides what a film shows: waveform, code, or both | before either film is scripted | synthesis / API / both | Nik Bear Brown | Open |
| Q-02 | Who is it for, and why is it in Walker? (vision, audience, pillars, PX goals `[MISSING]`) | The GDD cannot move past description | with Q-01 | teaching demo / film source / seed for an instrument toy | Nik Bear Brown | Open |
| Q-03 | Which features are CORE? None tagged; inferred 4/6 = 67% | Only matters if anything is added | before any addition | accept / tag formally | Nik Bear Brown | Open |
| Q-04 | Are a stop control, other waveforms, or a waveform visualizer wanted? | Title-only adaptation today; any addition changes that claim | before any code change | none / stop only / visualizer | Nik Bear Brown | Open |
| Q-05 | How is the abrupt-exit leak handled? | Captures that quit abruptly repeat the ObjectDB warning; no production fix exists | before capture resumes | orderly teardown in capture harness only (current) / production fix / accept and document | Nik Bear Brown | Open |
| Q-06 | What playback level is safe for films? | Full-scale sine at volume 1.0 | before capture | fixed film level / normalize in edit with the change marked | Nik Bear Brown | Open |
