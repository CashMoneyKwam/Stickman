extends Node2D


@onready var action_items: Array[String]
@onready var settings_grid_container = %SettingsGridContainer
@onready var back = %Back

# Called when the node enters the scene tree for the first time.
#func _ready(): 
	#$HSlider.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
	

func _on_volume_pressed():
	$Volume/volume_slider.show()
