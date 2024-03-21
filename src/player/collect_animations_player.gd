extends Node

@onready
var anim = $"../collect_animations"
@onready
var collect_timer = $"../collect"

func _ready():
	SignalBus.connect("play_collect_anim", play_collect)
	anim.visible = false


func play_collect(type : String):
	collect_timer.start()
	anim.visible = true
	if type == "fire":
		anim.play("fire")
		PlayerManager.unlock_ability("fireball")
	if type == "shadow":
		anim.play("shadow")
		PlayerManager.unlock_ability("dash")
	if type == "lightning":
		anim.play("lightning")
		PlayerManager.unlock_ability("lightning")
	if type == "acid":
		anim.play("acid")
		PlayerManager.unlock_ability("acid")

func _on_collect_timeout():
	SignalBus.emit_signal("picked_up", true)
	anim.visible = false
