extends Area2D

@onready
var anim = $AnimatedSprite2D
@onready
var laser = $Area2D/CollisionShape2D
@export 
var collision_area : CollisionShape2D 
@onready
var powerup = $powerup
@onready
var shoottimer = $shoottimer
@onready
var LaserAudio = $LaserBeam

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("lasers_on", shoot_lasers)
	anim.play("idle")
	laser.disabled = true

func shoot_lasers(inden : String):
	if collision_area.name == inden:
		#laser.disabled = false
		
		anim.play("shoot")
		powerup.start()

func _on_powerup_timeout():
	laser.disabled = false
	LaserAudio.play()
	shoottimer.start()

func _on_shoottimer_timeout():
	anim.play("idle")
	laser.disabled = true

func _on_area_2d_area_entered(area):
	if area.name == "hitbox":
		SignalBus.emit_signal("on_health_lost", -2)
