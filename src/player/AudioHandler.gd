extends Node

#@onready var FireballAudio = $"../Fireball"
#@onready var JumpingAudio = $"../Jumping"
#@onready var DashAudio = $"../Dash"
@onready var EatingAudio = $"../Eating"
@onready var ItemAudio = $"../ItemPickup"
#@onready var LightingAudio = $"../Lightning"

func _ready():
	SignalBus.connect("picked_up", picked_up)
	SignalBus.connect("increase_max_health", eating_noise)
	
func _process(delta):
	#if Input.is_action_just_pressed('jump') or Input.is_action_just_pressed('attack'):
	#	JumpingAudio.play()
	#if PlayerManager.is_ability_unlocked("dash") && Input.is_action_just_pressed('dash'):
	#	DashAudio.play()
	#if PlayerManager.is_ability_unlocked("fireball") && Input.is_action_just_pressed('fireball'):
	#	FireballAudio.play()
	#if PlayerManager.is_ability_unlocked("lightning") && Input.is_action_just_pressed('lightning'):
	#	LightingAudio.play()
	pass

func eating_noise(play_sound : bool):
	if play_sound:
		EatingAudio.play()

func picked_up(play_sound : bool):
	if play_sound:
		ItemAudio.play()
