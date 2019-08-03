extends State

const BUILDUP := 0.5

var time := 0.0

var direction := Vector2()

var attacked := false

export var speed = 400

func enter(host: Enemy) -> void:
	print(host.name, ": attaaack")

	direction = host.get_direction_to_player()



func input(host: Enemy, event: InputEvent) -> void:
	pass

func update(host: Enemy, delta: float) -> void:

	if not attacked:
		time += delta

		if time > BUILDUP:
			time = 0.0
			_attack(host)

	if not host.motion.length() < 100 and attacked:
		host.change_state("idle")

func exit(host: Enemy) -> void:
	attacked = false
	host.motion = Vector2()

func _attack(host: Enemy) -> void:
	if direction:
		host.motion = direction * speed
		host.tween.interpolate_property(host, "motion", host.motion, Vector2(), 1.2, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		host.tween.start()
		attacked = true