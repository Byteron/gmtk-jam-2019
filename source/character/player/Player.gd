extends Character
class_name Player

var current_animation := ""
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

func play_footstep() -> void:
	Sounds.play_sfx("Footstep")

func play_upper(anim_name: String) -> void:

	if anim_upper.current_animation == anim_name:
		return

	anim_upper.play(anim_name)

func play_lower(anim_name: String) -> void:

	if anim_lower.current_animation == anim_name:
		return

	anim_lower.play(anim_name)

func get_input_direction() -> Vector2:

	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	return Vector2(int(right) - int(left), int(down) - int(up))

func get_fwd_bw() -> String:
	var shoot_direction = bow.get_shoot_direction()

	if facing.x * shoot_direction.x > 0 or facing.y * shoot_direction.y > 0:
		return "_fwd"
	return "_bw"

func collect_arrow() -> void:
	bow.arrows = 1

func can_shoot() -> bool:
	return bow.arrows > 0

func _on_death() -> void:
	change_state("dead")