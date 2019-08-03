extends Character
class_name Enemy

onready var anim := $AnimationPlayer as AnimationPlayer
onready var tween := $Tween as Tween

func _on_HitBox_body_entered(body: PhysicsBody2D) -> void:

	if body is Arrow:
		body.hit()
		hurt(body.damage)

	if body is Player and not dead:
		body.hurt(1)
