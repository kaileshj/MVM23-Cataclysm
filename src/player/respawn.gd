extends State;

var direction := 1.0
@export
var respawn_timer : Timer 
@export
var idle_state : State 

func enter() -> void:
	#print("respawning")
	respawn_timer.start()
	super()

	if animations.flip_h:
		direction = -1
	else:
		direction = 1

# Just to be safe, disable any other inputs
func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

# Override movement inputs	
func get_movement_input() -> float:
	return direction

func get_jump() -> bool:
	return false

func _on_respawn_timeout():
	#PlayerManager.just_died = false
	#print(PlayerManager.just_died)
	return idle_state
