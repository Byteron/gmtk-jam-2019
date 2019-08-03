extends Character

onready var anim := $AnimationPlayer as AnimationPlayer
onready var tween := $Tween as Tween

func _on_HitBox_body_entered(body: PhysicsBody2D) -> void:

	if body is Arrow:
		body.hit()
		hurt(body.damage)

func _on_death() -> void:
	tween.interpolate_property(self, "modulate:a", 1, 0, 0.8, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_all_completed")
	queue_free()
