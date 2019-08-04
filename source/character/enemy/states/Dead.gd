extends State

func enter(host: Enemy) -> void:
	host.motion = Vector2(0, 0)
	host.tween.stop_all()
	host.anim.play("die")