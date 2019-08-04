extends Node2D

var time = 0.0
var score := 0

var kill_score := 0
var kill_multiplier := 0.5

export var kill_streak_multiplier := 0.5
export var score_per_second := 5
export var score_per_kill := 100

onready var hud := $HUD as HUD

onready var spawner := $Spawner as YSort
onready var score_timer := $ScoreTimer as Timer
onready var kill_timer := $KillTimer as Timer

func _process(delta: float) -> void:
	time += delta

func _on_Enemy_died(enemy: Enemy) -> void:
	kill_score += enemy.health_max * score_per_kill
	kill_multiplier += kill_streak_multiplier
	kill_timer.start()

func _on_Spawner_enemy_spawned(enemy) -> void:
	enemy.connect("died", self, "_on_Enemy_died", [ enemy ])

func _on_ScoreTimer_timeout() -> void:
	score += score_per_second * score_timer.wait_time
	hud.update_score(score)

func _on_KillTimer_timeout() -> void:
	score += kill_score * kill_multiplier
	kill_score = 0
	kill_multiplier = kill_streak_multiplier
	hud.update_score(score)
