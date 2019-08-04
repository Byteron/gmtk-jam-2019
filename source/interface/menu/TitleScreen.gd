extends Control

func _ready() -> void:
	Music.play_song("Music")

func _on_Play_pressed() -> void:
	Scene.change("Game", true)

func _on_Quit_pressed() -> void:
	get_tree().quit()
