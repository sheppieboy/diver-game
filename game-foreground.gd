extends Node2D

class_name foreground

signal diver_hit_ground

var speed = -100


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

	# Check if the leading edge of frame 1 is off-screen
	if ground_frame_1.global_position.x + ground_frame_1.texture.get_width() < 0:
		# Update the position of frame 1 to the trailing edge of frame 4
		ground_frame_1.global_position.x = ground_frame_4.global_position.x + ground_frame_4.texture.get_width()

	# Check if the leading edge of frame 2 is off-screen
	if ground_frame_2.global_position.x + ground_frame_2.texture.get_width() < 0:
		# Update the position of frame 2 to the trailing edge of frame 1
		ground_frame_2.global_position.x = ground_frame_1.global_position.x + ground_frame_1.texture.get_width()

	# Check if the leading edge of frame 3 is off-screen
	if ground_frame_3.global_position.x + ground_frame_3.texture.get_width() < 0:
		# Update the position of frame 3 to the trailing edge of frame 2
		ground_frame_3.global_position.x = ground_frame_2.global_position.x + ground_frame_2.texture.get_width()

	# Check if the leading edge of frame 4 is off-screen
	if ground_frame_4.global_position.x + ground_frame_4.texture.get_width() < 0:
		# Update the position of frame 4 to the trailing edge of frame 3
		ground_frame_4.global_position.x = ground_frame_3.global_position.x + ground_frame_3.texture.get_width()


#custom signal to check when the diver hits the ground
func _diver_hits_ground(body):
	
	pass
	
