extends Character
class_name Player

var arrows := 1

onready var anim_upper := $Upper/AnimationPlayer as AnimationPlayer
onready var anim_lower := $Lower/AnimationPlayer as AnimationPlayer

onready var tween := $Tween as Tween

onready var bow = $Bow

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot") and arrows > 0:
		_shoot()

func _ready() -> void:
	change_state("idle")

func _process(delta: float) -> void:
	bow.rotate(get_mouse_direction().angle())

func set_crosshair(crosshair: Node) -> void:
	bow.set_crosshair(crosshair)

func get_mouse_direction() -> Vector2:
	return global_position.direction_to(get_global_mouse_position()).normalized()

func get_input_direction() -> Vector2:

	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	return Vector2(int(right) - int(left), int(down) - int(up))

func _shoot() -> void:
	var arrow = Instance.Arrow()
	arrow.global_position = bow.global_position
	get_tree().root.add_child(arrow)
	arrows -= 1