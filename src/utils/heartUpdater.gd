extends Node2D

@onready
var heartsContainer = $HealthContainerLayer/HeartContainer
@onready
var playerHealth = $player/HealthSystem
@onready
var player = $player

func _ready():
	heartsContainer.setMaxHearts(playerHealth.maxHealth)
	heartsContainer.updateHearts(playerHealth.health)
	playerHealth.player_health_changed.connect(heartsContainer.updateHearts)

func _physics_process(delta):
	pass
