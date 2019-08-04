extends KinematicBody2D
class_name Character

signal died()
signal health_changed(health)

var health := 1 setget _set_health

var motion := Vector2()

var dead := false

export var team_number := 1
export var health_max := 1

onready var particle_spawner := $ParticleSpawner as ParticleSpawner

onready var fsm := $FiniteStateMachine as FiniteStateMachine

func _ready() -> void:
	fsm.host = self
	health = health_max

func _physics_process(delta: float) -> void:
	move_and_slide(motion)

func hurt(damage: int) -> void:
	_set_health(health - damage)

func heal(amount: int) -> void:
	_set_health(health + amount)

func spawn_hit(origin: Vector2) -> void:
	particle_spawner.spawn_hit(origin, global_position)

func change_state(state_name: String) -> void:
	fsm.change_state(state_name)

func _set_health(new_health: int) -> void:
	health = clamp(new_health, 0, health_max)

	emit_signal("health_changed", health)

	if health == 0:
		emit_signal("died")

func _on_death() -> void:#
	dead = true
	change_state("dead")