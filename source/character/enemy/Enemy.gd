extends Character
class_name Enemy

export var vision := 300
export var attack_range := 100

onready var anim := $AnimationPlayer as AnimationPlayer
onready var tween := $Tween as Tween

func _ready() -> void:
	change_state("idle")

func get_direction_to_player() -> Vector2:

	if not Global.Player:
		return Vector2()

	return global_position.direction_to(Global.Player.global_position).normalized()

func is_player_in_vision() -> bool:
	return _is_player_in_reach(vision)

func is_player_in_attack_range() -> bool:
	return _is_player_in_reach(attack_range)

func _is_player_in_reach(reach: int) -> bool:

	if not Global.Player:
		return false

	return global_position.distance_to(Global.Player.global_position) <= reach

func _on_HitBox_body_entered(body: PhysicsBody2D) -> void:

	if body is Arrow:
		body.hit()
		hurt(body.damage)

	if body is Player and not dead:
		body.hurt(1)
