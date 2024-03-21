extends Node2D

@onready var BgMusic = $"BgMusic-Calm"
var bgMusicOn = true

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://src/Rooms/1-StartingRoom.tscn")
	SignalBus.emit_signal("started_game", true)

func _process(delta):
	update_music_status()
	
func update_music_status():
	if bgMusicOn:
		if !BgMusic.playing:
			BgMusic.play()
	else:
		BgMusic.stop()
