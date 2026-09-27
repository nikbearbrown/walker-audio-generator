# Verification and friction — 2026-09-24 21:35 UTC heartbeat

Read entire source README, project configuration, generator script and scene.
No source audio AGENTS.md found. Confirmed destination absent and no existing
render/Godot worker before independent copy. Changed local title only; original
MIT attribution and all assets retained. No external audio assets in this demo:
the script synthesizes stereo sine samples using push_frame.

Godot 4.7.2 headless import and ordinary 120-frame runtime exit 0. No script
errors observed, but ordinary runtime terminal output reports one ObjectDB
instance leaked at exit (not present in its log file); this is not a clean
shutdown pass. The explicitly stopped/drained diagnostic did not report that
warning. generator-20260924.log records 15
passing assertions: playback initialized, sample rate 22050 and initial tone
440, wrapped phase, focused End/Home/Right events setting frequency 1000/100/101
and labels, phase staying in range, and volume 1/.001/.002 converting to
expected decibels and displayed text. Diagnostic stops playback and drains
0.2 seconds before freeing the scene; production script unchanged.

These are synthetic GUI input and headless/Dummy-driver state checks, NOT
heard audio or waveform verification. Pitch correctness at the output device,
clipping, underruns, buffer latency and audiovisual synchronization remain
unverified. No capture or films created. The existing visible-capture constraint
after user window closure still applies; no visible window reopened. Both
films remain pending, not retired or human-approved. Proceed next feasible
item and revisit genuine capture/film skills when available.

## 2026-09-26 18:36 UTC follow-up

Verbose reproduction identifies the single leaked object as
AudioStreamGeneratorPlayback, reference count 1, on abrupt --quit-after exit.
Releasing the script reference in _exit_tree did not fix it; that experimental
change was reverted, and both diagnostic logs retained (runtime-verbose and
runtime-release, dated 20260926). No production shutdown fix is claimed.

New test_restart.gd performs three real scene instantiate/play/stop/free cycles,
disabling buffer filling and releasing the playback reference after stop, with
a 0.2-second drain before free. All three pass and verbose process shutdown is
clean in restart-20260926.log. The 15 existing assertions also pass again in
generator-regression-20260926.log. This narrows the observed issue to teardown
ordering/timing, without proving an engine-level cause or hardware audio safety.
Use orderly capture teardown when capture resumes; abrupt quit remains a known
limitation. No source changes, heard audio or film completion claimed.
