extends YSort

signal enemy_spawned(enemy)

var enemies_max := 4

onready var spawn_points = $SpawnPoints.get_children()
onready var enemies := $Enemies

func refill() -> void:

	var enemy_count = enemies.get_child_count()

	if not enemy_count < enemies_max:
		return

	var enemy = Instance.Enemy()
	enemies.add_child(enemy)
	enemy.global_position = spawn_points[randi() % spawn_points.size()].global_position
	emit_signal("enemy_spawned", enemy)

func _on_Timer_timeout() -> void:
	refill()
