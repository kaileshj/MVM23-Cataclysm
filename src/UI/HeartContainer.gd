extends HBoxContainer

@onready
var HeartGuiClass = preload("res://src/UI/HeartGui.tscn")

func _ready():
	SignalBus.connect("increase_max_health", increase_max_hearts)
	setMaxHearts(PlayerManager.get_max_health())

func increase_max_hearts(increase : bool):
	setMaxHearts(1)
	
func _process(delta):
	updateHearts(PlayerManager.get_current_health())

func setMaxHearts(maxHearts : int):
	for i in range(maxHearts):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)

func updateHearts(currentHealth : int):
	var hearts = get_children()
	var numHearts = hearts.size()
	for i in range(currentHealth):
		if i < numHearts:  # Check if the index exists
			hearts[i].update(true)
		else:
			break  # If the index doesn't exist, exit the loop
	for i in range(currentHealth, numHearts):
		hearts[i].update(false)

