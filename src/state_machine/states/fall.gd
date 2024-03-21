extends State

@export
var idle_state: State
@export
var move_state: State
@export
var dash_state: State
@export
var death_state : State
@onready var timers = $"../../timers"

var direction := 1.0

func enter() -> void:
	super()
	if animations.flip_h:
		direction = -1
	else:
		direction = 1

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	var movement = get_movement_input() * move_speed
	if movement != 0:
		animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	else:
		animations.flip_h = direction < 0
	return null
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('dash'):
		if PlayerManager.is_ability_unlocked("dash") && !timers.no_dash:
			timers.dash.start()
			timers.no_dash = true
			return dash_state
	return null
