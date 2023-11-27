extends Node

@onready var diver = $Player
@onready var npc_spawner = $NPCSpawner
@onready var foreground = $Foreground

func _ready():
	diver.started.connect(_on_started)
	foreground.diver_hit_ground.connect(game_over)
	npc_spawner.diver_eaten.connect(game_over)

func _on_started():
	(npc_spawner as NPCSpawner).start_spawning_npcs()
	
func game_over():
	(foreground as Foreground).stop_ground_moving()
	(diver as Player).hit_ground()
	(npc_spawner as NPCSpawner).stop()
	
	
	