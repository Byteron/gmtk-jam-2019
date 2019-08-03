extends Node

const Arrow = preload("res://source/projectiles/Arrow.tscn")

func Arrow() -> Arrow:
	return Arrow.instance() as Arrow