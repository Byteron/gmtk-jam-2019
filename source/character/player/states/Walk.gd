extends State

var speed = 250
var aim_speed = 120

func enter(host: Player) -> void:
	host.anim_lower.play("walk")

func input(host: Player, event: InputEvent) -> void:

	if event.is_action_pressed("dash"):
		host.change_state("dash")

func update(host: Player, delta: float) -> void:

	var input_direction = host.get_input_direction()

	if Input.is_action_pressed("shoot"):
		host.motion = aim_speed * input_direction.normalized()
	else:
		host.motion = speed * input_direction.normalized()

	if not input_direction:
		host.change_state("idle")

func exit(host: Player) -> void:
	pass
