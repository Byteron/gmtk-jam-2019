extends State

func enter(host: Player) -> void:
	host.anim_lower.play("dash")

func input(host: Player, event: InputEvent) -> void:
	pass

func update(host: Player, delta: float) -> void:
	pass

func exit(host: Player) -> void:
	pass
