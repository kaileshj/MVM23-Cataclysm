extends CharacterBody2D

const SPEED = 300.0
const CHASE_SPEED = 450.0
const JUMP_VELOCITY = -400.0
const SPIN_PAUSE = 0.5
const PATROL_TIME = 2.0  # Time in seconds to move in one direction

@onready
var anim = $animations
@onready
var player_detector = $PlayerDetector
@onready
var spin_timer = $spin
@onready
var unspin_timer = $unspin
@onready
var charge_timer = $charge
@onready
var RobotAudio = $RobotNoises
@onready
var damageable = $Damageable

var is_attacking : bool = false 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var patrol_timer = PATROL_TIME
#var spin_timer = SPIN_PAUSE
var direction = 1  # 1 for right, -1 for left
var state = "patrol"  # Initial state
var player : Node

func _ready():
	#anim.connect("animation_finished", self, "_on_animations_animation_finished")
	RobotAudio.play()
	set_physics_process(true)

func _physics_process(delta):
	match state:
		"patrol":
			_handle_patrol(delta)
		"spin":
			# Add your spin logic here
			_handle_spin(delta)
			#state = "chase"
		"chase":
			_handle_chase(delta)
		"unspin":
			_handle_spin(delta)

	# Add gravity if not on floor
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	# Common movement logic
	move_and_slide()

func _handle_patrol(delta):
	if !damageable.stop_anim:
		anim.play("move")
	#patrol_timer -= delta
	if is_on_wall():#patrol_timer <= 0:
		direction *= -1  # Change direction
		player_detector.position.x *= -1
		#patrol_timer = PATROL_TIME
	if direction == -1:
		anim.flip_h = false
		player_detector.scale.x = 1
	else:
		anim.flip_h = true
		player_detector.scale.x = -1

	velocity.x = direction * SPEED

func _handle_spin(delta):
	#spin_timer -= delta
	velocity.x *= 0
	

func _handle_chase(delta):
	# Move towards the player more quickly
	# Replace `get_player_position()` with your method of obtaining the player's position
	if !damageable.stop_anim:
		anim.play("spinmovement")
	velocity.x = direction * CHASE_SPEED

func get_player_position() -> Vector2:
	player = get_tree().current_scene.get_node("player")
	return player.position  # Return the actual player position


func _on_player_detector_body_entered(body):
	if is_attacking or body.name != "player" or state != "patrol":
		return 
	
	#print("state is spin")
	
	var player_position = get_player_position()  
	if player_position.x < global_position.x:
		direction = -1
	else:
		direction = 1
	if !damageable.stop_anim:
		anim.play_backwards("unspin")
	spin_timer.start()
	state = "spin"
	is_attacking = true

func _on_spin_timeout():
	#print("timed out")
	charge_timer.start()
	state = "chase"

func _on_charge_timeout():
	if !damageable.stop_anim:
		anim.play("unspin")
	unspin_timer.start()
	state = "unspin"
	
func _on_unspin_timeout():
	state = "patrol"
	is_attacking = false
	
