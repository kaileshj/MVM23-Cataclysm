extends Node

var player : Node
var anim : Node

var player_pos = Vector2(0,0)

var from_death : bool = false
var move : bool = false
var flip : bool = false
var new_pos : bool = false

func initialize_scene(current_scene_name : String, prev_scene_name : String):
	player = get_tree().current_scene.get_node("player")
	anim = player.get_node("movement_animations")

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
		if prev_scene_name == "PracticeFight" or prev_scene_name == "UnlockShadowCapsule":
			if !from_death:
				player_pos = Vector2(558,384)
				move = true
				flip = true
			else:
				player_pos = Vector2(90,384)
				move = true
				flip = false
				from_death = false
	if current_scene_name == "StartingRoom":
		if prev_scene_name == "UnlockShadowCapsule":
			player_pos = Vector2(90,384)
			move = true
			flip = false
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
			player_pos = Vector2(2262,256)
			move = true
			flip = true
	if current_scene_name == "LaserSmall":
		if prev_scene_name == "LongComputerRoom":
			player_pos = Vector2(1622,320)
			move = true
			flip = true
	if current_scene_name == "RealRoom":
		if prev_scene_name == "LaserSmall":
			player_pos = Vector2(1483,256)
			move = true
			flip = true
	if current_scene_name == "LaserAfterShadow":
		if prev_scene_name == "RealRoom":
			player_pos = Vector2(1929,64)
			move = true
			flip = true
	if current_scene_name == "LaserAfterShadow":
		if prev_scene_name == "FireballJumpRoom":
			player_pos = Vector2(1895,1023)
			move = true
			flip = true
	if current_scene_name == "FireballJumpRoom":
		if prev_scene_name == "FireballJumpRoom2":
			player_pos = Vector2(2375,448)
			move = true
			flip = true
	if current_scene_name == "FireballJumpRoom2":
		if prev_scene_name == "FireballJumpFinalScene":
			player_pos = Vector2(2379,328)
			move = true
			flip = true
	if current_scene_name == "FireballJumpFinalScene":
		if prev_scene_name == "FireballJumpRoom2":
			player_pos = Vector2(1367,33)
			move = true
			flip = true
	if current_scene_name == "RealRoom":
		if prev_scene_name == "BuzzSaw1":
			player_pos = Vector2(1435,1536)
			move = true
			flip = true
	if current_scene_name == "RealRoom":
		if prev_scene_name == "LaserAfterShadow":
			player_pos = Vector2(1211,1536)
			move = true
			flip = true
	if current_scene_name == "BuzzSaw1":
		if prev_scene_name == "BuzzSaw2":
			player_pos = Vector2(3346,576)
			move = true
			flip = true
	if current_scene_name == "BuzzSaw2":
		if prev_scene_name == "LaserSmall":
			player_pos = Vector2(108,384)
			move = true
			#flip = true
	if current_scene_name == "BuzzSaw2":
		if prev_scene_name == "FinalBoss":
			player_pos = Vector2(1227,320)
			move = true
			flip = true
	if current_scene_name == "LaserSmall":
		if prev_scene_name == "BuzzSaw2":
			player_pos = Vector2(1591,832)
			move = true
			flip = true
	if current_scene_name == "BuzzSaw2":
		if prev_scene_name == "PostBoss":
			player_pos = Vector2(1222,320)
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
