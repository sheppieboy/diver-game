extends Control

var background_process_manager = preload("res://background_process_manager.tscn")

@onready var label = $TextureRect/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	var game_manager = background_process_manager.instantiate() as Background_Manager
	var gold_count = game_manager.load()
	label.text = "Gold Collected: " + "%d" % gold_count
	



func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	


func _on_quit_pressed():
	get_tree().quit()
