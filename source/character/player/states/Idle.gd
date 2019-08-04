extends State

func enter(host: Player) -> void:
	host.anim_lower.play("idle")

	if Input.is_action_pressed("shoot"):
		host.anim_upper.play("aim_idle")
	else:
		host.anim_upper.play("idle")

func input(host: Player, event: InputEvent) -> void:

	if event.is_action_pressed("dash"):
		host.change_state("dash")

func update(host: Player, delta: float) -> void:

	if Input.is_action_just_released("shoot"):
		host.play_upper("idle")
	elif Input.is_action_pressed("shoot") and host.can_shoot():
		host.play_upper("aim_idle")

	if host.get_input_direction():
		host.change_state("walk")

func exit(host: Player) -> void:
	pass
