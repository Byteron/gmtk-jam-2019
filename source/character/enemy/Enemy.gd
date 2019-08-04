extends Character
class_name Enemy

var presets := [
	{
		"health": 1,
		"speed": -20,
		"attack_speed": 0,
		"texture": preload("res://graphics/characters/enemies/enemy_1.png")
	},
	{
		"health": 1,
		"speed": -50,
		"attack_speed": -50,
		"texture": preload("res://graphics/characters/enemies/enemy_2.png")
	},
	{
		"health": 0,
		"speed": 0,
		"attack_speed": -20,
		"texture": preload("res://graphics/characters/enemies/enemy_3.png")
	},
	{
		"health": 0,
		"speed": 10,
		"attack_speed": 10,
		"texture": preload("res://graphics/characters/enemies/enemy_4.png")
	},
	{
		"health": 0,
		"speed": 20,
		"attack_speed": 20,
		"texture": preload("res://graphics/characters/enemies/enemy_5.png")
	},
	{
		"health": 2,
		"speed": -30,
		"attack_speed": -100,
		"texture": preload("res://graphics/characters/enemies/enemy_6.png")
	},
]

var current_animation := ""
var facing := Vector2()

export var vision := 300
export var attack_range := 100

onready var anim := $AnimationPlayer as AnimationPlayer
onready var tween := $Tween as Tween

onready var sprite := $Sprite as Sprite

onready var walk_state := $FiniteStateMachine/Walk
onready var attack_state := $FiniteStateMachine/Attack

onready var health_bar := $Healthbar

onready var spawn_grace_timer := $SpawnGraceTimer as Timer

func _ready() -> void:
	var preset = presets[randi() % presets.size()]

	health_max += preset.health
	walk_state.speed += preset.speed
	attack_state.speed += preset.attack_speed

	sprite.texture = preset.texture

	health_bar.initialize(health_max)
	restore()

	modulate.a = 0.5

	change_state("idle")

func restore() -> void:
	health = health_max

func get_direction_to_player() -> Vector2:

	if not Global.Player:
		return Vector2()

	return global_position.direction_to(Global.Player.global_position).normalized()

func play_anim(anim_name: String) -> void:
	current_animation = anim_name
	update_animation(get_direction_to_player())

func update_facing(direction: Vector2) -> void:

	if direction.x > 0.5:
		direction.x = 1
		direction.y = 0
	elif direction.x < -0.5:
		direction.x = -1
		direction.y = 0
	elif direction.y > 0.5:
		direction.y = 1
		direction.x = 0
	elif direction.y < -0.5:
		direction.y = -1
		direction.x = 0

	facing = direction

func update_animation(direction: Vector2) -> void:
	update_facing(direction)

	match facing:
		Vector2.UP: anim.play(current_animation + "_up")
		Vector2.DOWN: anim.play(current_animation + "_down")
		Vector2.LEFT: anim.play(current_animation + "_left")
		Vector2.RIGHT: anim.play(current_animation + "_right")

func is_player_in_vision() -> bool:
	return _is_player_in_reach(vision)

func is_player_in_attack_range() -> bool:
	return _is_player_in_reach(attack_range)

func _is_player_in_reach(reach: int) -> bool:

	if not Global.Player:
		return false

	return global_position.distance_to(Global.Player.global_position) <= reach

func _set_health(new_health) -> void:
	._set_health(new_health)
	health_bar.update_health(new_health)

func _on_HitBox_body_entered(body: PhysicsBody2D) -> void:

	if body is Arrow and spawn_grace_timer.is_stopped():
		body.hit()
		hurt(body.damage)
		spawn_hit(body.global_position)

	if body is Player and not dead and spawn_grace_timer.is_stopped():
		body.hurt(1)

func _on_SpawnGraceTimer_timeout() -> void:
	modulate.a = 1.0
