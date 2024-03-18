extends HBoxContainer
@onready
var HeartGuiClass = preload("res://src/UI/HeartGui.tscn")

func setMaxHearts(maxHearts : int):
	
	for i in range(maxHearts):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)

func updateHearts(currentHeath : int):
	var hearts = get_children()
	for i in range(currentHeath):
		hearts[i].update(true)
	for i in range(currentHeath, hearts.size()):
		hearts[i].update(false)
