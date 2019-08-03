extends CanvasLayer
class_name HUD

onready var corsair = $Corsair as Sprite

func _ready() -> void:
	get_tree().call_group("Player", "set_corsair", corsair)
