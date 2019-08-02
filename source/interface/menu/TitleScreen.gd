extends Control

func _ready() -> void:
	Scene.register_scene("Game", "res://source/game/Game.tscn")

func _on_Play_pressed() -> void:
	Scene.change("Game", true)

func _on_Quit_pressed() -> void:
	get_tree().quit()
