extends Node2D

@onready var laser_timer = $lasertimer

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayer.play_music_level_challenge()
	SignalBus.emit_signal("lasers_on", "Laser1")
	SignalBus.emit_signal("lasers_on", "Laser2")
	SignalBus.emit_signal("lasers_on", "Laser3")
	SignalBus.emit_signal("lasers_on", "Laser4")
	SignalBus.emit_signal("lasers_on", "Laser5")
	SignalBus.emit_signal("lasers_on", "Laser6")
	SignalBus.emit_signal("lasers_on", "Laser7")
	laser_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lasertimer_timeout():
	SignalBus.emit_signal("lasers_on", "Laser1")
	SignalBus.emit_signal("lasers_on", "Laser2")
	SignalBus.emit_signal("lasers_on", "Laser3")
	SignalBus.emit_signal("lasers_on", "Laser4")
	SignalBus.emit_signal("lasers_on", "Laser5")
	SignalBus.emit_signal("lasers_on", "Laser6")
	SignalBus.emit_signal("lasers_on", "Laser7")
	laser_timer.start()
