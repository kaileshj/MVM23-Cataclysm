extends CharacterBody2D

@export var speed = 200
@export var patrol_distance = 400
@export var bullet_speed = 300
@export var shoot_interval = 1.0 # Seconds
@export var Bullet : PackedScene


@onready
var RobotAudio = $RobotNoises
@onready
var anim = $AnimatedSprite2D

var direction = 1
var original_position
var shoot_timer = 0
var detected = false

func _ready():
	#print(global_position)
	original_position = position
	anim.play("move")
	RobotAudio.play()

func _process(delta):
	# Patrol logic
	var move_amount = speed * direction * delta
	position.x += move_amount
	
	if abs(position.x - original_position.x) > patrol_distance:
		direction *= -1 # Change direction
	
	# Shooting logic
	shoot_timer += delta
	if shoot_timer >= shoot_interval:
		shoot_timer = 0
		if detected:
			shoot()

func shoot():
	var laser_bullet = Bullet.instantiate()
	laser_bullet.set_starting_pos(global_position)
	get_tree().current_scene.add_child(laser_bullet)


func _on_playerdetector_body_entered(body):
	if body.name == 'player':
		detected = true
