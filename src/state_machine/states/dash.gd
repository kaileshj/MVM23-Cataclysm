extends 'res://src/state_machine/states/move.gd'

@export
var move_state: State
@onready var DashAudio = $"../../Dash"
@export
var time_to_dash := 0.5

var dash_timer := 0.0
var direction := 1.0

func enter() -> void:
	print("running")
	super()
	dash_timer = time_to_dash

	# Simple check for which direction to dash towards
	if animations.flip_h:
		direction = -1
	else:
		direction = 1

# Just to be safe, disable any other inputs
func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	dash_timer -= delta
	if dash_timer <= 0.0:
		# Fall back on the default input implementation to
		# determine where to go next
		if super.get_movement_input() != 0.0:
			return move_state
		return idle_state
	
	# At this point, run 'process_physics' in the move script as written
	return super(delta)
	DashAudio.play()

# Override movement inputs
func get_movement_input() -> float:
	return direction

func get_jump() -> bool:
	return false
