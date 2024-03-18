extends Node

var player : Node
var anim : Node
var camera : Node

var player_pos = Vector2(0,0)

var move : bool = false
var flip : bool = false
var new_pos : bool = false

func initialize_scene(current_scene_name : String, prev_scene_name : String):
	player = get_tree().current_scene.get_node("player")
	anim = player.get_node("movement_animations")
	camera = get_tree().current_scene.get_node("Camera2D")

	if current_scene_name == "PracticeFight":
		if prev_scene_name == "SmallCorridor":
			player_pos = Vector2(792,256)
			move = true
			flip = true
	if current_scene_name == "SmallCorridor":
		if prev_scene_name == "LearnParkour":
			player_pos = Vector2(541,384)
			move = true
			flip = true
	if current_scene_name == "StartingRoom":
		if prev_scene_name == "PracticeFight":
			player_pos = Vector2(558,384)
			move = true
			flip = true
	if current_scene_name == "RealRoom":
		if prev_scene_name == "ExtraLongCorridor":
			player_pos = Vector2(102,1535)
			move = true
			flip = false
	if current_scene_name == "LearnParkour":
		if prev_scene_name == "RealRoom":
			player_pos = Vector2(1134,256)
			move = true
			flip = true
	if current_scene_name == "ExtraLongCorridor":
		if prev_scene_name == "RealRoom":
			player_pos = Vector2(2340,453)
			move = true
			flip = true
	if current_scene_name == "LaserSmall":
		if prev_scene_name == "LongComputerRoom":
			player_pos = Vector2(1737,382)
			move = true
			flip = true
	if current_scene_name == "RealRoom":
		if prev_scene_name == "LaserSmall":
			player_pos = Vector2(1483,256)
			move = true
			flip = true
	elif current_scene_name == "PracticeFight":
		if prev_scene_name == "StartingRoom":
			pass

func _physics_process(_delta):
	if move:
		player.position = player_pos
		if flip:
			print_debug("flipped")
			anim.flip_h = not anim.flip_h
		if player.position == player_pos:
			print_debug("signal emitted")
			move = false
			SignalBus.emit_signal("in_new_pos_in_new_scene", true)
