extends CharacterBody2D

@onready
var collect_timer = $collect
@onready 
var interaction_area : InteractionArea = $InteractionArea
@onready
var anim = $AnimatedSprite2D
@export
var ability_type : String 

func _ready():
	anim.play(ability_type + "idle")
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	collect_timer.start()
	anim.play(ability_type + "collect")

func _on_collect_timeout():
	SignalBus.emit_signal("play_collect_anim", ability_type)
	queue_free()
