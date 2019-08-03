extends Character
class_name Player

var facing := Vector2(1, 0)

onready var anim_upper := $Upper/AnimationPlayer as AnimationPlayer
onready var anim_lower := $Lower/AnimationPlayer as AnimationPlayer

onready var tween := $Tween as Tween

onready var bow = $Bow

func _ready() -> void:
	Global.Player = self

	change_state("idle")

func _process(delta: float) -> void:
	var input_direction = get_input_direction()

	if input_direction:
		facing = input_direction

func get_input_direction() -> Vector2:

	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	return Vector2(int(right) - int(left), int(down) - int(up))

func collect_arrow() -> void:
	bow.arrows = 1

func _on_death() -> void:
	change_state("dead")