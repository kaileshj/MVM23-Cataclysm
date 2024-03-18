extends Node

signal player_health_changed

@export
var maxHealth : int = 3
@export
var health : int = maxHealth


func _on_hitbox_area_entered(area):
	if area.name == "attackarea":
		health -= 1
		player_health_changed.emit(health)
