extends TextureRect

func _init():
	print("init")
	
	var background = get_node(".")
	var image = background.get_image("res://Assets/StartScreen.png")
	print("TR size: ", background.size)
	background.set_size(Vector2(200,200))
	print(background.get_stretch_mode())
	print(background.get_texture())
	

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	var background = get_node(".")
	print(background.size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
