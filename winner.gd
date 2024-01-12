extends Area2D

@export var sprite: Node2D
@export var label: CollisionShape2D

signal gameover

func show_gameover():
	$Restart2.show()

func _ready():
	sprite.hide()
	$Restart.hide()
#func _ready():
	#Button.hide()

func _on_body_entered(body: Node2D):
	sprite.show()
	Engine.time_scale = 0 
	#get_tree().paused = true
	$Restart.show()





func _on_restart_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
