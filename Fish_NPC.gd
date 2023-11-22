extends CharacterBody2D
class_name Fish_NPC
var speed = 0

signal diver_hit


func set_speed(sp):
	speed = sp
	
func _diver_hit_npc(body):
	diver_hit.emit()

func _process(delta):
	position.x += speed * delta
	
