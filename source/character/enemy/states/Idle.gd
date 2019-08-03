extends State

func enter(host: Enemy) -> void:
	print(host.name, ": idlee")
	pass

func input(host: Enemy, event: InputEvent) -> void:
	pass

func update(host: Enemy, delta: float) -> void:

	if host.is_player_in_attack_range():
		host.change_state("attack")
	elif host.is_player_in_vision():
		host.change_state("walk")

func exit(host: Enemy) -> void:
	pass