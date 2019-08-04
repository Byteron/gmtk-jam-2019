extends Control

onready var last_score_label := $CenterContainer/VBoxContainer/LastScore as Label
onready var best_score_label := $CenterContainer/VBoxContainer/BestScore as Label

func _ready() -> void:
	last_score_label.text = "Score: %d" % Global.last_score
	best_score_label.text = "Best: %d" % Global.high_score

func _on_Retry_pressed() -> void:
	Scene.change("Game")

func _on_TitleScreen_pressed() -> void:
	Scene.change("TitleScreen")
