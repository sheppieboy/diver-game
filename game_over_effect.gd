extends Node

class_name GameOverEffect

@onready var animation = $AnimationPlayer

func play():
	animation.play("burst")
