extends CollisionShape2D

@export
var facing_left_position : Vector2
@export
var facing_right_position : Vector2

func _ready():
	SignalBus.connect("facing_direction_changed", on_flip_direction)

func on_flip_direction(flip : bool):
	if flip:
		position = facing_left_position
	else:
		position = facing_right_position

