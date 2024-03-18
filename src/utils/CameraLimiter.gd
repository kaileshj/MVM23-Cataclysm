extends RemoteTransform2D

const LEVEL_HEIGHT : int = 448
const LEVEL_WIDTH : int = 642

var camera_height : int 
var camera_width : int
var target_pos_x : int
var target_pos_y : int

@export
var area2d: Area2D

func _ready():
	var viewport = get_viewport()
	camera_height = viewport.size.y
	camera_width = viewport.size.x
	
func _process(delta):
	var pos = get_parent().global_position
	if LEVEL_WIDTH-(camera_width/2) > camera_width/2:
		target_pos_x = clamp(position.x, camera_width/2, LEVEL_WIDTH-(camera_width/2))
	else:
		target_pos_x = pos.x
		
	if LEVEL_HEIGHT-(camera_height/2) > camera_height/2:
		target_pos_y = clamp(position.y, camera_height/2, LEVEL_HEIGHT-(camera_height/2))
	else:
		target_pos_y = pos.y

	self.global_position = Vector2(target_pos_x, target_pos_y)
