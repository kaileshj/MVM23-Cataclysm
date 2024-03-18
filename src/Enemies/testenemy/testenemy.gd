extends CharacterBody2D

@export
var navigation_target : NavigationAgent2D
@export
var movement_target : Node2D
@export
var movement_speed : float = 200.0

func _ready():
	navigation_target.path_desired_distance = 4.0
	navigation_target.target_desired_distance = 4.0
	
	call_deferred("actor_setup")

func actor_setup():
	await get_tree().physics_frame
	
	set_movement_target(movement_target.position)
	
func set_movement_target(target_point : Vector2):
	navigation_target.target_position = target_point
	
func _physics_process(delta):
	if navigation_target.is_navigation_finished():
		return
	
	var current_agent_position : Vector2 = global_position
	var next_path_position : Vector2 = navigation_target.get_next_path_position()
	var new_velocity : Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * movement_speed
	
	velocity = new_velocity
	
	move_and_slide()
