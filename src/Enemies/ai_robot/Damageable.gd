extends Node
class_name Damageable

@export
var knockback_velocity : Vector2 = Vector2(100,0)
@export
var character : CharacterBody2D
@export
var timer : Timer

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
	character.velocity = knockback_velocity * knockback_direction
	if(health <= 0):
		get_parent().queue_free()


func _on_timer_timeout():
	character.velocity = Vector2.ZERO
