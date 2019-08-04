extends State

func enter(host: Player) -> void:
	if not Input.is_action_pressed("shoot"):
		host.anim_upper.play("idle")
	host.anim_lower.play("idle")

func input(host: Player, event: InputEvent) -> void:

	if event.is_action_pressed("dash"):
		host.change_state("dash")

func update(host: Player, delta: float) -> void:

	if host.get_input_direction():
		host.change_state("walk")

func exit(host: Player) -> void:
	pass
