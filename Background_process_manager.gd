extends Node

class_name Background_Manager

@onready var diver = $Player
@onready var npc_spawner = $NPCSpawner
@onready var foreground = $Foreground
@onready var display = $CanvasLayer as Display

const SAVE_FILE_PATH = "res://saved.bin"

var gold = 0

func _ready():
	diver.started.connect(_on_started)
	foreground.diver_hit_ground.connect(game_over)
	npc_spawner.diver_eaten.connect(game_over)
	npc_spawner.got_gold.connect(collect_gold)
	
	

func _on_started():
	(npc_spawner as NPCSpawner).start_spawning_npcs()
	
func game_over():
	(foreground as Foreground).stop_ground_moving()
	(diver as Player).hit_ground()
	(npc_spawner as NPCSpawner).stop_spawning()
	(display as Display).on_game_over()
	save()
	
func collect_gold():
	gold += 1
	display.update_label(gold)

#saves gold count for the game
func save():
	#write to the file
	var game_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	var dict: Dictionary = {
		"gold": gold,
	}
	var jsonGameObjects = JSON.stringify(dict)
	game_file.store_line(jsonGameObjects)

#loads the game data
func load():
	var game_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_FILE_PATH) == true:
		if not game_file.eof_reached():
			#read the line in the JSON file
			var read_line = JSON.parse_string(game_file.get_line())
			if read_line:
				#access dictionary with gold key and set the gold in the file
				gold = read_line["gold"]


