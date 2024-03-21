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
@export
var respawn_state : State
@export
var acid_state : State
@export
var heal_state : State
@onready var timers = $"../../timers"

func enter() -> void:
	super()
	SignalBus.connect("picked_up", picked_up)
	parent.velocity.x = 0

func picked_up(is_picked : bool) -> State:
	print('heal')
	if is_picked:
		return heal_state
	return null

func process_input(event: InputEvent) -> State:
	if get_jump() and parent.is_on_floor():
		return jump_state
	if get_movement_input() != 0.0:
		return move_state
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
	if Input.is_action_just_pressed('fireball'):
		if PlayerManager.is_ability_unlocked("fireball") && !timers.no_fireball:
		#PlayerManager.unlock_ability("fireball")
			print("fireballs triggered")
			timers.fireball.start()
			timers.no_fireball = true
			return fireball_state
	if Input.is_action_just_pressed('lightning'):
		if PlayerManager.is_ability_unlocked("lightning") && !timers.no_fireball:
			timers.lightning.start()
			timers.no_lightning = true
			print("lightning triggered")
			return lightning_state
	return null

func process_physics(delta: float) -> State:
	if PlayerManager.current_health <= 0:
		return death_state
	#if PlayerManager.just_died:
	#	return respawn_state
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
