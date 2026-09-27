extends SceneTree

var failures := 0
func _initialize() -> void:
	call_deferred("run")
func check(ok: bool, label: String) -> void:
	print("PASS " if ok else "FAIL ", label)
	if not ok:
		failures += 1
func key(code: Key) -> void:
	for pressed in [true, false]:
		var event := InputEventKey.new()
		event.keycode = code
		event.pressed = pressed
		root.push_input(event, true)
		await process_frame
func run() -> void:
	root.size = Vector2i(1280, 720)
	var demo: Node = load("res://generator.tscn").instantiate()
	root.add_child(demo)
	await process_frame
	var player: AudioStreamPlayer = demo.get_node("Player")
	check(player.playing and demo.playback is AudioStreamGeneratorPlayback, "generator playback initialized")
	check(player.stream.mix_rate == 22050.0 and demo.pulse_hz == 440.0, "initial sample and tone rates")
	check(demo.phase >= 0.0 and demo.phase < 1.0, "phase wrapped after initial fill")
	var frequency: HSlider = demo.get_node("CenterContainer/Frequency/FrequencyHSlider")
	frequency.grab_focus()
	for code in [KEY_END, KEY_HOME, KEY_RIGHT]:
		await key(code)
		var expected := 1000 if code == KEY_END else (100 if code == KEY_HOME else 101)
		check(demo.pulse_hz == expected and demo.get_node("%FrequencyLabel").text == "%d Hz" % expected, "frequency keyboard state " + str(expected))
		check(demo.phase >= 0.0 and demo.phase < 1.0, "phase remains wrapped " + str(expected))
	var volume: HSlider = demo.get_node("CenterContainer/Volume/VolumeHSlider")
	volume.grab_focus()
	for code in [KEY_END, KEY_HOME, KEY_RIGHT]:
		await key(code)
		var expected := 1.0 if code == KEY_END else (0.001 if code == KEY_HOME else 0.002)
		check(is_equal_approx(volume.value, expected) and is_equal_approx(player.volume_db, linear_to_db(expected)), "volume keyboard conversion " + str(expected))
		check(demo.get_node("%VolumeLabel").text == "%.2f dB" % linear_to_db(expected), "volume label " + str(expected))
	player.stop()
	await create_timer(0.2).timeout
	demo.queue_free()
	await process_frame
	print("HEADLESS/DUMMY STATE ONLY: no heard pitch, waveform capture, latency or film verification; failures=", failures)
	quit(1 if failures else 0)
