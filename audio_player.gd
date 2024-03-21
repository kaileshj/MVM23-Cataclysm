extends AudioStreamPlayer

const LEVEL_MUSIC = preload("res://src/music/Serene.wav")
const BOSS_MUSIC = preload("res://src/music/Heavy.wav")
const CHALLENGE_MUSIC = preload("res://src/music/Awesome.wav")

func _play_music(music : AudioStream, volume = -20.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	
func play_music_level_calm():
	_play_music(LEVEL_MUSIC)
	
func play_music_level_boss():
	_play_music(BOSS_MUSIC)

func play_music_level_challenge():
	_play_music(CHALLENGE_MUSIC)

func play_FX(stream : AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	await fx_player.finished
	
	fx_player.queue_free()
