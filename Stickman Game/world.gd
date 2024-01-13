extends Node2D

@onready var pause_menu = $Camera2D/PauseMenu

var paused = false

@onready var anim = $CollisionShape2D/PlayerAnim

func _ready():
	Engine.time_scale = 1
	#anim.play("Idle")
	#anim.play("Idle2")
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu(): 		
	if paused:	
		pause_menu.hide()
		Engine.time_scale = 1	
	else:
		pause_menu.show()
		Engine.time_scale = 0 
		
	paused = !paused
	
	
		
		
