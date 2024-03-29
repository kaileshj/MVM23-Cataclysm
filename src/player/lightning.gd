extends 'res://src/state_machine/states/jump.gd'

@export
var jump_state: State

@export
var time_to_lightning := 4
@onready var LightingAudio = $"../../Lightning"
var lightning_timer := 0.0
var direction := 1.0

@export
var scratch : Area2D

#var allow_movement : bool = false

func enter() -> void:
	super.enter()
	scratch.monitoring = true
	lightning_timer = time_to_lightning
	move_speed = 0
	if animations.flip_h:
		direction = -1
	else:
		direction = 1

func process_physics(delta: float) -> State:
	lightning_timer -= delta
	if lightning_timer <= 3.6:#3.682:
		LightingAudio.play()
		return super.process_physics(delta)
	if lightning_timer <= 0.0:
		scratch.monitoring = false
		return idle_state
	
	return null

func get_movement_input() -> float:
	return direction

func get_jump() -> bool:
	return false
