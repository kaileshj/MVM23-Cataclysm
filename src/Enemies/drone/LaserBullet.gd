extends Area2D

var speed = 350
var direction : Vector2

var health : int
 
@onready
var player = get_tree().current_scene.get_node("player")

var starting_pos : Vector2
var target_pos : Vector2

func _ready():
	global_position = starting_pos
	target_pos = player.global_position
	direction = (target_pos - starting_pos).normalized()

func _physics_process(delta):
	position += direction * speed * delta

func _on_Bullet_body_entered(body):
	print(body)
	if body.name == "player":
		body.queue_free()
		queue_free()


func _on_area_entered(area):
	if area.name == "hitbox":
		health -= 1
		SignalBus.emit_signal("on_health_lost", health)
		queue_free()

func _on_body_entered(body):
	if "collisions" in body.name:
		queue_free()

func set_target_pos(pos : Vector2):
	target_pos = pos
	
func set_starting_pos(pos : Vector2):
	starting_pos = pos
