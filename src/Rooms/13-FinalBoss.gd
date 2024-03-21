extends Node2D

@onready var BossAudioStart = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	BossAudioStart.play()
	AudioPlayer.play_music_level_boss()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
