extends Control
class_name HUD

onready var crosshair = $Crosshair as Sprite

func _ready() -> void:
	get_tree().call_group("Bow", "set_crosshair", crosshair)
