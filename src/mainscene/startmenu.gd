extends Node2D

@onready
var heartsContainer = $HealthContainerLayer/HeartContainer
@onready
var playerHealth = $player/HealthSystem

func _ready():
	heartsContainer.setMaxHearts(playerHealth.maxHealth)
	heartsContainer.updateHearts(playerHealth.health)
	playerHealth.player_health_changed.connect(heartsContainer.updateHearts)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://src/Rooms/1-StartingRoom.tscn")
	SignalBus.emit_signal("started_game", true)
