extends State

var speed := 100

func enter(host: Enemy) -> void:
	print(host.name, ": waaaalk")

func input(host: Enemy, event: InputEvent) -> void:
	pass

func update(host: Enemy, delta: float) -> void:

	var direction = host.get_direction_to_player()

	host.motion = direction * speed

	if host.is_player_in_attack_range():
		host.change_state("attack")
	elif not host.is_player_in_vision():
		host.change_state("idle")

func exit(host: Enemy) -> void:
	host.motion = Vector2()