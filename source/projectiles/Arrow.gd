extends RigidBody2D
class_name Arrow

export var speed := 1200

func _ready() -> void:
	look_at(get_global_mouse_position())
	apply_impulse(Vector2(), ( get_global_mouse_position() - global_position ).normalized() * speed)

