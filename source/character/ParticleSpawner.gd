extends Node
class_name ParticleSpawner

func spawn_hit(origin: Vector2, spawn_position: Vector2) -> void:
	var hit = Instance.Hit()
	hit.global_position = spawn_position
	get_tree().current_scene.add_child(hit)
	hit.look_at(origin)
	hit.play()