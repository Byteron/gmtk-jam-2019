extends Control

var score := 0

onready var label := $Label as Label
onready var spawn_point := $SpawnPoint as Control
onready var tween := $Tween as Tween

func update_score(new_score) -> void:
	var diff = new_score - score
	score = new_score
	label.text = "%d" % score
	_spawn_popup_label(diff)

	tween.stop_all()
	tween.interpolate_property(label, "rect_scale", Vector2(1, 1), Vector2(1.2, 1.2), 0.1, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.interpolate_property(label, "rect_scale", Vector2(1.2, 1.2), Vector2(1, 1), 0.1, Tween.TRANS_CUBIC, Tween.EASE_OUT, 0.1)
	tween.start()

func _spawn_popup_label(number: int) -> void:
	var popup_label = Instance.PopupLabel()
	spawn_point.add_child(popup_label)
	popup_label.popup(number)
