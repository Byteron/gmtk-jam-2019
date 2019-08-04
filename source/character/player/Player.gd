extends Character
class_name Player

const body_down_tex := preload("res://graphics/characters/player/mc-body-forward.png")
const body_side_tex := preload("res://graphics/characters/player/mc-body-side.png")
const body_up_tex := preload("res://graphics/characters/player/mc-body-forward.png")

const legs_down_tex := preload("res://graphics/characters/player/mc-legs-forward.png")
const legs_side_tex := preload("res://graphics/characters/player/mc-legs-side.png")
const legs_up_tex := preload("res://graphics/characters/player/mc-legs-forward.png")

var current_animation := ""
var facing := Vector2(1, 0)

onready var anim_upper := $Upper/AnimationPlayer as AnimationPlayer
onready var anim_lower := $Lower/AnimationPlayer as AnimationPlayer

onready var sprite_upper := $Upper/Sprite
onready var sprite_lower := $Lower/Sprite

onready var tween := $Tween as Tween

onready var bow = $Bow

func _ready() -> void:
	Global.Player = self

	change_state("idle")

func _process(delta: float) -> void:
	var input_direction = get_input_direction()

	if input_direction:
		facing = input_direction

	if facing.x == 1:
		flip_right()
	if facing.x == -1:
		flip_left()

	var anim_direction = get_anim_direction()

	match anim_direction:
		Vector2.UP:
			sprite_upper.texture = body_up_tex
			sprite_lower.texture = legs_up_tex
		Vector2.DOWN:
			sprite_upper.texture = body_down_tex
			sprite_lower.texture = legs_down_tex
		Vector2.LEFT:
			sprite_upper.texture = body_side_tex
			sprite_lower.texture = legs_side_tex
		Vector2.RIGHT:
			sprite_upper.texture = body_side_tex
			sprite_lower.texture = legs_side_tex

func flip_left():
	sprite_lower.flip_h = true
	sprite_upper.flip_h = true

func flip_right():
	sprite_lower.flip_h = false
	sprite_upper.flip_h = false

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

func get_anim_direction() -> Vector2:
	var direction = get_input_direction()

	if facing.y:
		direction.x = 0
	elif facing.x:
		direction.y = 0

	return direction

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