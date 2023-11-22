extends Node2D

class_name foreground
var speed = -10

@onready var ground_frame_1 =$"ground-frame-1/Sprite2D"
@onready var ground_frame_2 = $"ground-frame-2/Sprite2D"

func _ready():
	#set starting positions for foreground
	ground_frame_2.global_position.x = ground_frame_1.global_position.x + ground_frame_1.texture.get_width()
	
func _process(delta):
	#movement of foreground
	ground_frame_1.global_position.x += speed * delta
	ground_frame_2.global_position.x += speed * delta
	
	#find if a frame is moving out of frame and change position
	
	#if ground frame 1 is out of the screen, update it to the end of ground frame 2s position
	if ground_frame_1.global_position.x < -ground_frame_1.texture.get_width():
		ground_frame_1.global_position.x = ground_frame_2.global_position.x + ground_frame_2.texture.get_width()
	
	#if ground frame 2 is out of the screen, update it to the end of ground frame 1
	if ground_frame_2.global_position.x < -ground_frame_2.texture.get_width():
		ground_frame_2.global_position.x = ground_frame_1.global_position.x + ground_frame_1.texture.get_width()
	
	
	

