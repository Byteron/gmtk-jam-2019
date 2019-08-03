extends Node2D

var time = 0.0

onready var hud := $HUD as HUD

onready var enemies := $Enemies as YSort
onready var enemy_timer := $EnemyTimer as Timer

func _process(delta: float) -> void:
	time += delta