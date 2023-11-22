extends Node

class_name NPCSpawner

signal game_over

var fish = preload("res://Fish_NPC.tscn")

@export var fish_speed = -150

@onready var spawn_rate: Timer = $Timer

func _ready():
	print_tree_pretty()
	print(spawn_npc)
	if spawn_rate != null:
		
		spawn_rate.timeout.connect(spawn_npc)
	else:
		print("Error: spawn_rate is null. Make sure the Timer node is assigned in the scene.")

	
	
func start_spawning():
	spawn_rate.start()

func spawn_npc():
	var fish_instance = fish.instantiate() as Fish_NPC
	add_child(fish_instance)
	
	var x_range = Vector2(600, 1000)
	var y_range = Vector2(100, 800)
	
	var rand_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
	var rand_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
	
	fish_instance.position.y = rand_y
	fish_instance.position.x = rand_x
	
	fish.diver_hit.connect(on_hit_diver)

func on_hit_diver():
	game_over.emit()
	diver_hit_npc()
	
func diver_hit_npc():
	spawn_rate.stop()
	for fish_instance in get_children().filter(func (child): return child is Fish_NPC):
		(fish_instance as Fish_NPC).speed = 0
