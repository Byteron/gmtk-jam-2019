extends YSort

signal enemy_spawned(enemy)

export var max_enemies := 4
export var max_health := 1

onready var spawn_points = $SpawnPoints.get_children()
onready var enemies := $Enemies

func refill() -> void:

	var enemy_count = enemies.get_child_count()

	if not enemy_count < max_enemies:
		return

	var enemy = Instance.Enemy()
	enemy.health_max = (randi() % max_health) + 1
	enemies.add_child(enemy)
	enemy.global_position = spawn_points[randi() % spawn_points.size()].global_position
	emit_signal("enemy_spawned", enemy)

func _on_Timer_timeout() -> void:
	refill()
