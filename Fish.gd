extends Node2D

class_name Fish

var speed = 0

signal diver_entered
signal point_scored

func set_speed(new_speed):
	speed = new_speed
	
func _process(delta):
	position.x += speed*delta

func _diver_entered(body):
	diver_entered.emit()
	

