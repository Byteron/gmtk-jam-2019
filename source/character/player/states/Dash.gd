extends State

var force := 720
var friction := 1500

var direction := Vector2()

func enter(host: Player) -> void:
	host.anim_lower.play("dash")
	direction = host.facing.normalized()
	host.motion = direction * force

func update(host: Player, delta: float) -> void:

	host.motion -= Vector2(friction, friction) * direction * delta

	if host.motion.length() < 500:
		host.motion = Vector2()
		host.fsm.change_state("idle")

func exit(host: Player) -> void:
	pass
