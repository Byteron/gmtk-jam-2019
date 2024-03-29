extends Node2D

const DEADZONE = 0.2

signal force_increased(force)

var arrows := 1

var time = 0.0
var force = 1

var prev_direction := Vector2()

export var force_max := 5
export var force_time := 0.35

onready var crosshair := $CrosshairHook as RemoteTransform2D

func _process(delta: float) -> void:
	_process_input(delta)
	_process_roation()

func _process_input(delta: float) -> void:

	if not arrows:
		return

	if Input.is_action_just_released("shoot"):
		_shoot()
		var player = get_parent()
		player.play_upper(player.anim_lower.current_animation)

	if Input.is_action_pressed("shoot"):
		# get_parent().play_upper("aim")

		if force == force_max:
			return

		time += delta

		if time > force_time:
			force += 1
			Sounds.play_sfx("BowCharge%d" % force)
			time = 0.0
			emit_signal("force_increased")
			get_tree().call_group("GameCam", "shake", 4, 0.1, 1)


func _process_roation() -> void:

	if Devices.current_device == Devices.DEVICES.GAMEPAD:
		var direction = Vector2(Input.get_joy_axis(0, JOY_AXIS_2), Input.get_joy_axis(0, JOY_AXIS_3))

		if direction.x > -DEADZONE and direction.x < DEADZONE and direction.y > -DEADZONE and direction.y < DEADZONE:
			direction = Vector2()

		if direction:
			rotation = direction.angle()

	elif Devices.current_device == Devices.DEVICES.KEYBOARD:
		rotation = get_mouse_direction().angle()

func set_crosshair(node: Node) -> void:
	crosshair.remote_path = node.get_path()

func get_mouse_direction() -> Vector2:
	return global_position.direction_to(get_global_mouse_position()).normalized()

func get_shoot_direction() -> Vector2:
	return global_position.direction_to(crosshair.global_position).normalized()

func _shoot() -> void:
	var arrow = Instance.Arrow()
	arrow.global_position = global_position
	arrow.direction = get_shoot_direction()
	arrow.force = force
	arrow.draw_time = force * force_time + time
	get_tree().current_scene.add_child(arrow)
	Sounds.play_sfx("ArrowShoot")

	arrows -= 1
	force = 1
	time = 0.0