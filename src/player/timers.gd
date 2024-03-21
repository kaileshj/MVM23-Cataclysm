extends Node

@onready var dash = $"../dash_timer"
@onready var fireball = $"../fireball_timer"
@onready var lightning = $"../lightning_timer"

var no_dash = false
var no_fireball = false
var no_lightning = false

func _on_dash_timer_timeout():
	no_dash = false

func _on_fireball_timer_timeout():
	no_fireball = false

func _on_lightning_timer_timeout():
	no_lightning = false
