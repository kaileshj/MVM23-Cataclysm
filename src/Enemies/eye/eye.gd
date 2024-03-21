extends CharacterBody2D

@onready
var anim = $animations
@onready
var close = $close
@onready
var open = $open
@onready
var idle = $idle
@onready
var damageable = $Damageable

func _ready():
	anim.play("idle")
	close.start()

func _on_close_timeout():
	if damageable.health > 0:
		anim.play("close")
		SignalBus.emit_signal("lasers_on", "LargerLaser7")
		SignalBus.emit_signal("lasers_on", "LargerLaser10")
	open.start()

func _on_open_timeout():
	if damageable.health > 0:
		anim.play("open")
		SignalBus.emit_signal("lasers_on", "LargerLaser1")
		SignalBus.emit_signal("lasers_on", "LargerLaser4")
		SignalBus.emit_signal("lasers_on", "LargerLaser6")
		SignalBus.emit_signal("lasers_on", "LargerLaser9")
	idle.start()

func _on_idle_timeout():
	if damageable.health > 0:
		anim.play("idle")
		SignalBus.emit_signal("lasers_on", "LargerLaser2")
		SignalBus.emit_signal("lasers_on", "LargerLaser3")
		SignalBus.emit_signal("lasers_on", "LargerLaser5")
		SignalBus.emit_signal("lasers_on", "LargerLaser8")
	close.start()
