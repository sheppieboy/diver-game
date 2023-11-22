extends Node2D

class_name foreground

signal diver_hit_ground

var speed = -80


@onready var ground_frame_1 = $"ground-frame-1/Sprite2D"
@onready var ground_frame_2 = $"ground-frame-2/Sprite2D"
@onready var ground_frame_3 = $"ground-frame-3/Sprite2D"
@onready var ground_frame_4 = $"ground-frame-4/Sprite2D"

func _ready():
	# Set starting positions for foreground
	ground_frame_2.global_position.x = ground_frame_1.global_position.x + ground_frame_1.texture.get_width()
	ground_frame_3.global_position.x = ground_frame_2.global_position.x + ground_frame_2.texture.get_width()
	ground_frame_4.global_position.x = ground_frame_3.global_position.x + ground_frame_3.texture.get_width()

func _process(delta):
	# Movement of foreground
	ground_frame_1.global_position.x += speed * delta
	ground_frame_2.global_position.x += speed * delta
	ground_frame_3.global_position.x += speed * delta
	ground_frame_4.global_position.x += speed * delta

	# if the leading frame of ground_flame 1 is off the screen then update the global position
	if ground_frame_1.global_position.x + ground_frame_1.texture.get_width() < 0:
		ground_frame_1.global_position.x = ground_frame_4.global_position.x + ground_frame_4.texture.get_width()

	# if the leading frame of ground_flame 2 is off the screen then update the global position
	if ground_frame_2.global_position.x + ground_frame_2.texture.get_width() < 0:
		ground_frame_2.global_position.x = ground_frame_1.global_position.x + ground_frame_1.texture.get_width()

	# if the leading frame of ground_flame 3 is off the screen then update the global position
	if ground_frame_3.global_position.x + ground_frame_3.texture.get_width() < 0:
		ground_frame_3.global_position.x = ground_frame_2.global_position.x + ground_frame_2.texture.get_width()

	# if the leading frame of ground_flame 4 is off the screen then update the global position
	if ground_frame_4.global_position.x + ground_frame_4.texture.get_width() < 0:
		ground_frame_4.global_position.x = ground_frame_3.global_position.x + ground_frame_3.texture.get_width()


#custom signal to check when the diver hits the ground
func _diver_hits_ground(body):
	diver_hit_ground.emit()
	stop_ground_moving()
	(body as Player).hit_ground()
	
func stop_ground_moving():
	speed = 0
	
	
