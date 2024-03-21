extends 'res://src/state_machine/states/jump.gd'

@export
var jump_state: State
@onready var FireballAudio = $"../../Fireball"
@export
var time_to_dash := 4

var dash_timer := 0.0
var direction := 1.0

var allow_movement : bool = false

func enter() -> void:
	super.enter()
	dash_timer = time_to_dash
	move_speed = 0
	if animations.flip_h:
		direction = -1
	else:
		direction = 1

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('move_left'):
		allow_movement = true
		move_speed = 60
		direction = -1
	elif Input.is_action_just_pressed('move_right'):
		allow_movement = true
		move_speed = 60
		direction = 1
	else:
		allow_movement = false
		move_speed = 0
	return null

func process_physics(delta: float) -> State:
	dash_timer -= delta
	if dash_timer <= 3.682:
		if allow_movement:
			var movement = direction * move_speed
			parent.velocity.x = movement
			parent.move_and_slide()
			FireballAudio.play()
		return super.process_physics(delta)
	if dash_timer <= 0.0:
		return idle_state
	
	return null

func get_movement_input() -> float:
	return direction

func get_jump() -> bool:
	return false
