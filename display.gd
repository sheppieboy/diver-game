extends CanvasLayer

class_name Display

@onready var label = $MarginContainer/Label
@onready var gv_text = $TextureRect
@onready var gv_button = $Button

func _ready():
	label.text = "%d" % 0

func update_label(gold: int):
	label.text = "%d" % gold

func on_game_over():
	gv_text.visible = true
	gv_button.visible = true


func _on_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
