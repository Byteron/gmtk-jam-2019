extends State

var speed = 250
var aim_speed = 120

func enter(host: Player) -> void:
	host.anim_lower.play("walk" + host.get_fwd_bw())

	if Input.is_action_pressed("shoot"):
		host.anim_upper.play("aim_walk" + host.get_fwd_bw())
	else:
		host.anim_upper.play("walk" + host.get_fwd_bw())

func input(host: Player, event: InputEvent) -> void:

	if event.is_action_pressed("dash"):
		host.change_state("dash")

func update(host: Player, delta: float) -> void:

	var input_direction = host.get_input_direction()

	host.play_lower("walk" + host.get_fwd_bw())

	if Input.is_action_pressed("shoot") and host.can_shoot():
		host.play_upper("aim_walk" + host.get_fwd_bw())
		host.motion = aim_speed * input_direction.normalized()
		host.anim_lower.playback_speed = 0.6
	else:
		host.play_upper("walk" + host.get_fwd_bw())
		host.motion = speed * input_direction.normalized()
		host.anim_lower.playback_speed = 1

	if not input_direction:
		host.change_state("idle")

func exit(host: Player) -> void:
	pass
