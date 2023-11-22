extends CharacterBody2D

class_name Player

@export var gravity = 900
@export var swim_force = 300
@export var rotation_speed = 2

@onready var diver = $AnimationPlayer

var terminal_velocity = 400

func _ready():
	velocity = Vector2(0,0)

#process to calculate movement of player
func _physics_process(delta):
	if Input.is_action_just_pressed("swim"):
		swim()
	
	#gravity impacting velocity
	velocity.y += gravity * delta
	
	#terminal velocity
	if velocity.y > terminal_velocity:
		velocity.y = terminal_velocity
		
	move_and_collide(velocity*delta)
	
	#rotate swimmer
	rotate_diver()

#swim
func swim():
	velocity.y = swim_force
	rotation = deg_to_rad(-30)
	
#moving the diver to face up or down
func rotate_diver():
	#upwards facing of diver
	if velocity.y < 0 && rad_to_deg(rotation) > 90:
		rotation -= rotation_speed * deg_to_rad(1)
	#downwards facing of diver
	elif velocity.y > 0 && rad_to_deg(rotation) <90:
		rotation += rotation_speed * deg_to_rad(1)
	

	
