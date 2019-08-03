extends Character
class_name Player

onready var anim_upper := $Upper/AnimationPlayer as AnimationPlayer
onready var anim_lower := $Lower/AnimationPlayer as AnimationPlayer

onready var tween := $Tween as Tween

onready var bow = $Bow

func _ready() -> void:
	change_state("idle")

func _process(delta: float) -> void:
	bow.rotate_corsair(get_mouse_direction().angle())

func get_mouse_direction() -> Vector2:
	return global_position.direction_to(get_global_mouse_position()).normalized()

func get_input_direction() -> Vector2:

	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	return Vector2(int(right) - int(left), int(down) - int(up))