extends State

func enter(host: Player) -> void:
	host.anim_lower.play("idle")

func input(host: Player, event: InputEvent) -> void:
	pass

func update(host: Player, delta: float) -> void:

	if host.get_input_direction():
		host.change_state("walk")

func exit(host: Player) -> void:
	pass
