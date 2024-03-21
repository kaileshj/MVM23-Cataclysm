extends Node

@export
var knockback_velocity : Vector2 = Vector2(100,0)

func _on_attackarea_area_entered(area):
	print(area)
	if area.name == "hitbox":
		SignalBus.emit_signal("on_health_lost", -1)
