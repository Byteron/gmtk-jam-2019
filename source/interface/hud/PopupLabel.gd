extends Label
class_name PopupLabel

onready var tween := $Tween as Tween

func popup(number: int) -> void:
	text = "+%d" % number
	rect_position = Vector2(rand_range(-5, 5), rand_range(-5, 5))
	tween.interpolate_property(self, "rect_scale", Vector2(0.5, 0.5), Vector2(1, 1), 0.1, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.interpolate_property(self, "rect_position", rect_position, Vector2(rect_position.x, -50), 0.4, Tween.TRANS_EXPO, Tween.EASE_IN, 0.4)
	tween.start()

func _on_Tween_tween_all_completed() -> void:
	queue_free()
