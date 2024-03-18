extends State

@export
var dash_state: State
@export
var fall_state: State
@export
var idle_state: State
@export
var jump_state: State
@export
var attack_state: State
@export
var fireball_state: State
@export
var allow_fall : bool
@export
var lightning_state: State
#var platVel = Vector2(0,0)

signal facing_direction_changed(facing_right : bool)

var platVel = Vector2(0,0)

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('dash'):
		return dash_state
	if Input.is_action_just_pressed('attack'):
		return attack_state
	if Input.is_action_just_pressed('fireball'):
		return fireball_state
	if Input.is_action_just_pressed('lightning'):
		print("lightning triggered")
		return lightning_state
	return null

func process_physics(delta: float) -> State:
	if get_jump() and parent.is_on_floor():
		return jump_state
	platVel = parent.get_platform_velocity()
	
	parent.velocity.y += gravity * delta

	var movement = get_movement_input() * move_speed
	
	if movement == 0:
		return idle_state
	animations.flip_h = movement < 0
	SignalBus.emit_signal("facing_direction_changed", animations.flip_h)
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor() && allow_fall:
		return fall_state
	return null
	

