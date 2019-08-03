extends State

var speed = 250

func enter(host: Player) -> void:
	host.anim_lower.play("walk")

func input(host: Player, event: InputEvent) -> void:
	pass

func update(host: Player, delta: float) -> void:

	var input_direction = host.get_input_direction()

	host.motion = speed * input_direction.normalized()

func exit(host: Player) -> void:
	pass
