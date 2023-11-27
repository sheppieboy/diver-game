extends Node2D

class_name Coin

var speed = 0

signal diver_collected


func set_speed(new_speed):
	speed = new_speed
	
func _process(delta):
	position.x += speed*delta

func _diver_collected(body):
	diver_collected.emit()
	queue_free()
