extends Control

const heart_full_tex := preload("res://graphics/interface/heart.png")
const heart_empty_tex := preload("res://graphics/interface/heart_empty.png")

var health_max := 0
var health := 0

onready var container := $HBoxContainer as HBoxContainer

func initialize(health_max: int) -> void:
	self.health_max = health_max
	health = health_max

	for i in health:
		var heart = TextureRect.new()
		heart.texture = heart_full_tex
		container.add_child(heart)

func update_health(health: int) -> void:
	for i in health_max:
		if i < health:
			container.get_child(i).texture = heart_full_tex
		else:
			container.get_child(i).texture = heart_empty_tex
	pass