extends Control
class_name HUD

onready var crosshair := $Crosshair as Sprite
onready var counter := $CanvasLayer/Counter as Control

func _ready() -> void:
	get_tree().call_group("Bow", "set_crosshair", crosshair)

func update_score(score: int) -> void:
	counter.update_score(score)