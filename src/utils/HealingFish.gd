extends Node2D

@onready 
var interaction_area : InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("interacting")
	PlayerManager.set_max_health(PlayerManager.get_max_health() + 1)
	PlayerManager.set_current_health(PlayerManager.get_max_health())
	SignalBus.emit_signal("increase_max_health", true)
	queue_free()
