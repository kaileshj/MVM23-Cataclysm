extends CollisionPolygon2D
class_name FacingCollisionShape2D

@export
var parent: CharacterBody2D
# Variable to keep track of the wall state
var was_on_wall = false

func _process(delta):
	# Check if the parent is on a wall and if the state has changed since the last frame
	if parent.is_on_wall() and not was_on_wall:
		_mirror_shape()
		was_on_wall = true
	elif not parent.is_on_wall() and was_on_wall:
		_mirror_shape()
		was_on_wall = false

func _mirror_shape():
	# Retrieve the current points of the collision shape
	var points = self.polygon
	# Iterate through each point and multiply the x value by -1
	for i in range(len(points)):
		points[i].x *= -1
	# Apply the modified points back to the collision shape
	self.polygon = points
