extends Area2D
class_name InteractionArea

@export 
var action_name : String = "interact"

var interact : Callable = func():
	pass

func _on_body_entered(body):
	if body.name == 'player':
		InteractionManager.register_area(self)

func _on_body_exited(body):
	if body.name == 'player':
		InteractionManager.unregistered_area(self)
