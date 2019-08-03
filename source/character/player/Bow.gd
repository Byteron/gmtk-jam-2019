extends Node2D

onready var corsair := $Corsair

func rotate_corsair(rot: float) -> void:
	corsair.rotation = rot