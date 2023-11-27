extends Node

class_name NPCSpawner

signal diver_eaten

var fish_scene = preload("res://Fish.tscn")

@export var fish_speed = -150
@onready var spawn_timer = $SpawnTimer

func _ready():
	spawn_timer.start()

func start_spawning_npcs():
	spawn_timer.timeout.connect(spawn_npcs)
	
	
func spawn_npcs():
	var fish = fish_scene.instantiate() as Fish
	add_child(fish)
	
	
	fish.position.x = 500
	fish.position.y = 300
	
	fish.diver_entered.connect(on_diver_entered)
	
	fish.set_speed(fish_speed)

func on_diver_entered():
	diver_eaten.emit()
	stop()
	
func stop():
	spawn_timer.stop()
	for fish in get_children().filter(func (child): return child is Fish):
		(fish as Fish).speed = 0

