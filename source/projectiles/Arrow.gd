extends RigidBody2D
class_name Arrow

var speed := 1200
var origin := Vector2()
var travel_distance = 600

func _ready() -> void:
	origin = global_position
	look_at(get_global_mouse_position())
	apply_impulse(Vector2(), ( get_global_mouse_position() - global_position ).normalized() * speed)

func _process(delta: float) -> void:
	if origin.distance_to(global_position) > travel_distance:
		mode = MODE_KINEMATIC

func _on_PickupArea_body_entered(body: PhysicsBody2D) -> void:

	if body is Player and mode == MODE_KINEMATIC:
		body.arrows += 1
		queue_free()
