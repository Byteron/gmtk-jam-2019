extends CanvasLayer

var scenes := {}

var next_scene := ""
var show_bar := false

onready var scene_loader := $SceneLoader as SceneLoader
onready var anim := $AnimationPlayer as AnimationPlayer
onready var progress_bar := $TextureProgress as TextureProgress

func register_scene(scene_name: String, path_to_scene: String) -> void:
	scenes[scene_name] = path_to_scene

func change(scene_name: String, show_bar: bool = false) -> void:

	if not scenes.has(scene_name):
		print("Scene \"%s\" does not exist" % scene_name)
		return

	self.show_bar = show_bar
	next_scene = scenes[scene_name]

	print("loading scene: %s" % next_scene)

	anim.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_out":
		scene_loader.load_interactive(next_scene)
		progress_bar.max_value = scene_loader.get_stage_count()

func _on_ProgressBar_value_changed(value: float) -> void:
	if progress_bar.max_value == value:
		progress_bar.visible = false
	elif not progress_bar.visible and show_bar:
		progress_bar.visible = true

func _on_SceneLoader_scene_loaded(scene) -> void:
	get_tree().change_scene_to(scene)
	anim.play("fade_in")
	next_scene = ""

func _on_SceneLoader_stage_changed(stage) -> void:
	progress_bar.value = stage