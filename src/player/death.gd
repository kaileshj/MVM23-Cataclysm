extends State;

var direction := 1.0
@export
var death_timer : Timer 
@export
var respawn_state : State 

func enter() -> void:
	PlayerManager.iframes = true
	death_timer.start()
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


func _on_death_timeout():
	print(get_tree().current_scene.name)
	SignalBus.emit_signal("on_transitioner_animation_finished", get_tree().current_scene.name, "StartingRoom")
	PlayerManager.set_current_health(PlayerManager.get_max_health())
	SceneLoader.from_death = true
	#PlayerManager.just_died = true
	return respawn_state
