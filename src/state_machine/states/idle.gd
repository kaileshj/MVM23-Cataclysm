extends State

@export
var dash_state: State
@export
var fall_state: State
@export
var jump_state: State
@export
var move_state: State
@export
var attack_state: State
@export
var fireball_state: State
@export
var lightning_state: State
@export
var death_state : State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if get_jump() and parent.is_on_floor():
		return jump_state
	if get_movement_input() != 0.0:
		return move_state
	if Input.is_action_just_pressed('dash'):
		return dash_state
	if Input.is_action_just_pressed('attack'):
		print("attack triggered")
		return attack_state
	if Input.is_action_just_pressed('fireball'):
		print("fireballs triggered")
		return fireball_state
	if Input.is_action_just_pressed('lightning'):
		print("lightning triggered")
		return lightning_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null

func death_change(health : int) -> State:
	if health <= 0:
		return death_state
	return null
