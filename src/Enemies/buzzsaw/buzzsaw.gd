extends CharacterBody2D

@onready
var BuzzSawAudio = $BuzzSaw

@onready
var anim = $AnimatedSprite2D

func _ready():
	anim.play("spin")
	BuzzSawAudio.play()
