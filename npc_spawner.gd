extends Node

class_name NPCSpawner

signal diver_eaten
signal got_gold

var fish_scene = preload("res://Fish.tscn")
var coin_scene = preload("res://Coin.tscn")

@export var fish_speed = -150
@export var coin_speed = -150

@onready var spawn_timer = $SpawnTimer

func _ready():
	spawn_timer.start()

func start_spawning_npcs():
	spawn_timer.timeout.connect(spawn_npcs)
	
	
func spawn_npcs():
	var fish = fish_scene.instantiate() as Fish
	var coin = coin_scene.instantiate() as Coin
	add_child(fish)
	add_child(coin)
	
	
	fish.position.x = 800
	var random_number = randi() % (500 - 50 + 1) + 50
	fish.position.y = random_number
	
	coin.position.x = fish.position.x
	
	var coin_diff = randi() % (50 - 20 + 1) + 20

# 	If the randomly generated value is less than 0, make it negative
	if randi() % 2 == 0:
		coin_diff *= -1
	
	coin.position.y = fish.position.y +coin_diff
	
	fish.diver_entered.connect(on_diver_entered)
	coin.diver_collected.connect(gold_collected)
	
	fish.set_speed(fish_speed)
	coin.set_speed(coin_speed)

func on_diver_entered():
	diver_eaten.emit()
	stop_spawning()

func gold_collected():
	got_gold.emit()
	
func stop_spawning():
	spawn_timer.stop()
	for fish in get_children().filter(func (child): return child is Fish):
		(fish as Fish).speed = 0
		
	for coin in get_children().filter(func (child): return child is Coin):
		(coin as Coin).speed = 0

