extends Node2D

var time = 0.0
var score := 0

onready var hud := $HUD as HUD

onready var enemies := $Enemies as YSort
onready var enemy_timer := $EnemyTimer as Timer

func _ready() -> void:

	for enemy in enemies.get_children():
		enemy.connect("died", self, "_on_Enemy_died", [ enemy ])

func _process(delta: float) -> void:
	time += delta

func _on_Enemy_died(enemy: Enemy) -> void:
	score += enemy.health_max
	hud.update_score(score)