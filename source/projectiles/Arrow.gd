extends RigidBody2D
class_name Arrow

var base_speed := 800
var travel_distance := 0

var force := 0
var direction := Vector2()

var damage := 0
var origin := Vector2()

func _ready() -> void:
	origin = global_position
	rotation = direction.angle()
	damage = force + 1
	_calculate_travel_distance()
	apply_impulse(Vector2(), ( direction * (base_speed + ( 200 * force))))

func _process(delta: float) -> void:

	if origin.distance_to(global_position) > travel_distance:
		mode = MODE_KINEMATIC

func hit() -> void:
	force -= 1
	damage -= 1

	if force == 0:
		set_deferred("mode", MODE_KINEMATIC)
	else:
		_calculate_travel_distance()

func _calculate_travel_distance() -> void:
	travel_distance = 300 + (100 * force)

func _on_PickupArea_body_entered(body: PhysicsBody2D) -> void:

	if body is Player and mode == MODE_KINEMATIC:
		body.collect_arrow()
		queue_free()
