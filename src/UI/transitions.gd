extends Control
class_name Transitioner

@export var scene_switch_anim : String = "fade_out"
@export var current_scene : String
@export var destination_scene : String

@onready var texture_rect : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer

func play_fade_in(should_play : bool):
	if should_play:
		print_debug("play fade in")
		#animation_player.queue("fade_in")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("in_new_pos_in_new_scene", play_fade_in)
	texture_rect.visible = false
	
func set_next_animation(fading_out : bool):
	if(fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")

func get_path_to_current_scene():
	return SceneManager.get_scene_path_from_name(current_scene)

func get_path_to_destination_scene():
	return SceneManager.get_scene_path_from_name(destination_scene)
		
func _on_animation_player_animation_finished(anim_name):
	if (anim_name == scene_switch_anim && destination_scene != null):
		SignalBus.emit_signal("on_transitioner_animation_finished", current_scene, destination_scene)
		texture_rect.visible = false
