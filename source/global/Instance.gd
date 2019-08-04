extends Node

const Enemy = preload("res://source/character/enemy/Enemy.tscn")
const Arrow = preload("res://source/projectiles/Arrow.tscn")

const PopupLabel = preload("res://source/interface/hud/PopupLabel.tscn")

func Enemy() -> Enemy:
	return Enemy.instance() as Enemy

func Arrow() -> Arrow:
	return Arrow.instance() as Arrow

func PopupLabel() -> PopupLabel:
	return PopupLabel.instance() as PopupLabel