extends Node2D

class_name Fish

var speed = 0

signal diver_entered


func set_speed(new_speed):
	speed = new_speed
	
func _process(delta):
	position.x += speed*delta

func _diver_entered(body):
	diver_entered.emit()
	

func _on_screen_exited():
	queue_free()
