extends Node2D

var time = 0.0
var score := 0

onready var hud := $HUD as HUD

onready var spawner := $Spawner as YSort

func _process(delta: float) -> void:
	time += delta

func _on_Enemy_died(enemy: Enemy) -> void:
	score += enemy.health_max
	hud.update_score(score)

func _on_Spawner_enemy_spawned(enemy) -> void:
	enemy.connect("died", self, "_on_Enemy_died", [ enemy ])
