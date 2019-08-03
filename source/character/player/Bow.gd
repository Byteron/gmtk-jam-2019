extends Node2D

onready var crosshair := $CrosshairHook as RemoteTransform2D

func set_crosshair(node: Node) -> void:
	crosshair.remote_path = node.get_path()

func rotate(rot: float) -> void:
	rotation = rot