extends CharacterBody2D

var player


func _on_detection_body_entered(body):
	if body.name == "Player":
		player = get_node("../Player")
		print(player.global_position)
