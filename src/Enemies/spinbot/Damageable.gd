extends Node
class_name Damageable

@export
var knockback_velocity : Vector2 = Vector2(100,0)
@export
var character : CharacterBody2D
@export
var timer : Timer
@export
var deathtimer : Timer

var stop_anim : bool = false

@onready
var anim = $"../animations"

@export
var health : float :
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

func hit(damage: int, knockback_direction : Vector2):
	timer.start()
	health -= damage
	print("enemy health: " + str(health))
	if health > 0:
		anim.play("hurt")
	elif health <= 0:
		print("playing death animation")
		#print(character.name)
		anim.play("death")
		stop_anim = true
		deathtimer.start()
		

func _on_timer_timeout():
	character.velocity = Vector2.ZERO

func _on_deathtimer_timeout():
	print(character.name)
	if character.name != 'Eye':
		stop_anim = false
		get_parent().queue_free()
	else:
		var player = get_tree().current_scene.get_node("player")
		SignalBus.emit_signal("on_transitioner_animation_finished", get_tree().current_scene.name, "PostBoss")
	
