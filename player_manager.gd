extends Node

#var just_died := false
var max_health := 3
var current_health := 3
var iframes := false
var iframe_timer := Timer.new() 
var abilities := {"lightning" : false, "dash" : false, "fireball" : false, "acid" : false}

func _process(delta):
	if get_current_health() <= 0:
		SignalBus.emit_signal("on_transitioner_animation_finished", get_tree().current_scene, "StartingRoom")
		set_current_health(get_max_health())

func _ready():
	SignalBus.connect("on_health_lost", handle_damage)
	add_child(iframe_timer)
	iframe_timer.wait_time = 1
	iframe_timer.one_shot = true 
	iframe_timer.connect("timeout", _on_iframe_timer_timeout)

func get_max_health() -> int:
	return max_health

func set_max_health(value: int) -> void:
	max_health = value
	if current_health > max_health:
		current_health = max_health
		
func get_current_health() -> int:
	return current_health

func handle_damage(value : int):
	if iframes or current_health == 0:
		return
	#if value < current_health:
	current_health += value
	print("current health is " + str(current_health))
	get_tree().current_scene.get_node("player").get_node("movement_animations").play("hurt")
	iframes = true
	iframe_timer.start()
	#else:
	#	current_health -= 1
	#	print("current health is " + str(current_health))
	
func set_current_health(value: int) -> void:
	current_health = value

func unlock_ability(ability_name: String) -> void:
	if abilities.has(ability_name):
		abilities[ability_name] = true

func is_ability_unlocked(ability_name: String) -> bool:
	return abilities.get(ability_name, false)

func _on_iframe_timer_timeout() -> void:
	iframes = false
