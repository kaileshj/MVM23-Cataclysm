extends Node

const STARTING_ROOM_PATH : String = "res://src/Rooms/1-StartingRoom.tscn"
const PRACTICE_FIGHT_PATH : String = "res://src/Rooms/2-PracticeFight.tscn"
const SMALL_CORRIDOOR_PATH : String = "res://src/Rooms/3-SmallCorridoor.tscn"
const LEARN_PARKOUR_PATH : String = "res://src/Rooms/4-LearnParkour.tscn"
const REAL_ROOM : String = "res://src/Rooms/5-RealRoom.tscn"
const EXTRA_LONG_CORRIDOOR : String = "res://src/Rooms/6-extraLongCorridoor.tscn"
const SHADOW_CAPSULE_ROOM : String = "res://src/Rooms/7-UnlockShadowCapsule.tscn"
const LASER_AFTER_SHADOW_ROOM : String = "res://src/Rooms/8-LaserAfterShadow.tscn"
const SMALL_LASER : String = "res://src/Rooms/9-LaserSmall.tscn"
const BUZZSAW_ROOM_ONE : String = "res://src/Rooms/10-BuzzSaw1.tscn"
const BUZZSAW_ROOM_TWO : String = "res://src/Rooms/11-BuzzSaw2.tscn"
const FIREBALL_JUMP_ROOM : String = "res://src/Rooms/12-FireballJumpRoom.tscn"
const FINAL_BOSS_LAB : String = "res://src/Rooms/13-FinalBoss.tscn"
const FIREBALL_JUMP_FINAL_ROOM : String = "res://src/Rooms/14-FireballJumpFinalScene.tscn"
const FIREBALL_JUMP_ROOM_TWO : String = "res://src/Rooms/15-FireballJumpRoom2.tscn"
const LONG_COMPUTER_ROOM : String = "res://src/Rooms/16-LongComputerRoom.tscn"
const POST_FINAL_BOSS_LAB : String = "res://src/Rooms/17-PostBoss.tscn"
const END : String = "res://src/Rooms/18-End.tscn"

func switch_to_scene(current_scene_name : String, new_scene_name : String):
	var path_to_current_scene = get_scene_path_from_name(current_scene_name)
	var path_to_new_scene = get_scene_path_from_name(new_scene_name)

	if not ResourceLoader.exists(path_to_current_scene):
		print_debug("scene doesnt exist: " + path_to_current_scene)

	if not ResourceLoader.exists(path_to_new_scene):
		print_debug("scene doesnt exist: " + path_to_new_scene)
	print("Before switching scenes: "+ str(get_tree().current_scene))
	get_tree().change_scene_to_file(path_to_new_scene)
	await get_tree().process_frame
	print("After switching scenes: "+  str(get_tree().current_scene))
	SceneLoader.initialize_scene(new_scene_name, current_scene_name)
	
func get_scene_path_from_name(name : String) -> String:
	match name:
		"StartingRoom":
			return STARTING_ROOM_PATH
		"PracticeFight":
			return PRACTICE_FIGHT_PATH
		"SmallCorridor":
			return SMALL_CORRIDOOR_PATH
		"LearnParkour":
			return LEARN_PARKOUR_PATH
		"RealRoom":
			return REAL_ROOM
		"ExtraLongCorridor":
			return EXTRA_LONG_CORRIDOOR
		"UnlockShadowCapsule":
			return SHADOW_CAPSULE_ROOM
		"LaserAfterShadow":
			return LASER_AFTER_SHADOW_ROOM
		"LaserSmall":
			return SMALL_LASER
		"BuzzSaw1":
			return BUZZSAW_ROOM_ONE
		"BuzzSaw2":
			return BUZZSAW_ROOM_TWO
		"FireballJumpRoom":
			return FIREBALL_JUMP_ROOM
		"FinalBoss":
			return FINAL_BOSS_LAB
		"FireballJumpFinalScene":
			return FIREBALL_JUMP_FINAL_ROOM
		"FireballJumpRoom2":
			return FIREBALL_JUMP_ROOM_TWO
		"LongComputerRoom":
			return LONG_COMPUTER_ROOM
		"PostBoss":
			return POST_FINAL_BOSS_LAB
		"End":
			return END
		_:
			print_debug("Scene name not recognized: " + name)
			return ""
	
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("on_transitioner_animation_finished", switch_to_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
