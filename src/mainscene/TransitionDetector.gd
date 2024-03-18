extends Area2D

@export var transitioner : Transitioner

func _on_body_entered(body):
	if(body.name == "player"):
		transitioner.set_next_animation(true)
