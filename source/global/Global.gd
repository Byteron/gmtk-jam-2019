extends Node

var Player : Player = null
var Terrain : TileMap = null

var last_score := 0 setget _set_last_score
var high_score := 0

func _ready() -> void:
	Scene.register_scene("TitleScreen", "res://source/interface/menu/TitleScreen.tscn")
	Scene.register_scene("GameOver", "res://source/interface/menu/GameOver.tscn")
	Scene.register_scene("Game", "res://source/game/Game.tscn")

func _set_last_score(score) -> void:
	last_score = score

	if last_score > high_score:
		high_score = last_score