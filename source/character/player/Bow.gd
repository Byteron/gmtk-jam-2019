extends Node2D

onready var corsair := $CorsairHook as RemoteTransform2D

func set_corsair(node: Node) -> void:
	corsair.remote_path = node.get_path()

func rotate(rot: float) -> void:
	rotation = rot