extends Node

@export
var parent: CharacterBody2D

var direction := 1.0
var following = false
var flipped = false

# When a wall is touched, move in the opposite direction
func get_movement_direction() -> float:
	if parent.is_on_wall():
		direction *= -1

	return direction

func wants_jump() -> bool:
	return false
