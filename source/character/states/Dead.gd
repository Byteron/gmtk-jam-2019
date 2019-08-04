extends State

func enter(host: Character) -> void:
	host.play_anim("idle")
	host.tween.interpolate_property(host, "modulate:a", 1, 0, 0.8, Tween.TRANS_LINEAR, Tween.EASE_IN)
	host.tween.start()
	yield(host.tween, "tween_all_completed")
	host.queue_free()