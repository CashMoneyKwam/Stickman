extends Control


@onready var action_items: Array[String]
@onready var settings_grid_container = %SettingsGridContainer
@onready var main_menu_button = %MainMenuButton

# Called when the node enters the scene tree for the first time.
#func _ready(): 
	#$HSlider.hide()

func _ready(): 
	create_action_remap_items()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_action_remap_items() -> void:
	var previous_item = settings_grid_container.get_child(settings_grid_container.get_child_count() - 1) 
	for index in range(action_items.size()):
		var action = action_items[index]
		var label = Label.new()
		label.text = action 
		settings_grid_container.add_child(label)
		
		var button = RemapButton.new()
		button.action = action
		button.focus_neighbor_top = previous_item.get_path()
		previous_item.focus_neighbor_bottom = button.get_path()
		if index == action_items.size() - 1: 
			main_menu_button.focus_neighbor_top = button.get_path()
			button.focus.neighbor_bottom = main_menu_button.get_path()
		previous_item = button
		settings_grid_container.add_child(button)
			
