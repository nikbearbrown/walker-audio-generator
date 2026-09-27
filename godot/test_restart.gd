extends SceneTree

func _initialize() -> void:
	call_deferred("run")
func run() -> void:
	for i in 3:
		var demo: Node = load("res://generator.tscn").instantiate()
		root.add_child(demo)
		await create_timer(0.2).timeout
		var player: AudioStreamPlayer = demo.get_node("Player")
		if not player.playing or not demo.playback is AudioStreamGeneratorPlayback:
			push_error("Playback did not initialize on cycle " + str(i))
			quit(1)
			return
		# Orderly diagnostic shutdown, not an engine quit-path fix.
		demo.set_process(false)
		player.stop()
		demo.playback = null
		await create_timer(0.2).timeout
		demo.queue_free()
		await process_frame
		print("PASS orderly playback restart cycle ", i + 1)
	quit(0)
