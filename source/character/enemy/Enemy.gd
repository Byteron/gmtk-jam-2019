extends Character

onready var anim := $AnimationPlayer as AnimationPlayer
onready var tween := $Tween as Tween



func _on_HitBox_body_entered(body: PhysicsBody2D) -> void:

	if body is Arrow:
		body.mode = RigidBody2D.MODE_KINEMATIC
		print("hit!")
		queue_free()

