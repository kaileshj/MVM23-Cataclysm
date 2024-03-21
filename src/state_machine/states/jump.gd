extends State

@onready var JumpingAudio = $"../../Jumping"

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State
@export
var dash_state : State
@export
var attack_state: State
@export
var jump_force: float = 900.0
@export
var fireball_state: State
@export
var acid_state : State
@export
var allow_fall : bool
@export
var death_state: State
@onready var timers = $"../../timers"

func enter() -> void:
	super()
	parent.velocity.y = -jump_force

func process_physics(delta: float) -> State:
	if PlayerManager.current_health <= 0:
		return death_state
	parent.velocity.y += gravity * delta
	if parent.velocity.y > 0 && allow_fall:
		return fall_state
	
	var movement = get_movement_input() * move_speed

	if movement != 0:
		animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	JumpingAudio.play()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	
	return null

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('dash'):
		if PlayerManager.is_ability_unlocked("dash") && !timers.no_dash:
			timers.dash.start()
			timers.no_dash = true
			return dash_state
	if Input.is_action_just_pressed('attack'):
		if PlayerManager.is_ability_unlocked("acid"):
			print("attack triggered")
			return acid_state
		else:
			return attack_state
	return null
