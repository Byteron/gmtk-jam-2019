extends Camera2D
class_name GameCam

onready var tween := $Tween as Tween

func _ready():
	offset = Vector2(0, 0)

func shake(amplitude: int, time := 0.2, shakes := 1) -> void:
	var delay: = 0.0

	for i in shakes:
		var new_offset = Vector2(rand_range(-amplitude, amplitude), rand_range(-amplitude, amplitude))
		tween.interpolate_property(self, "offset", offset, new_offset, time, Tween.TRANS_SINE, Tween.EASE_IN, delay)
		tween.interpolate_property(self, "offset", offset, Vector2(0, 0), time, Tween.TRANS_SINE, Tween.EASE_OUT, delay + time)
		amplitude = lerp(amplitude, 0, 0.75)
		delay += time
	tween.start()

