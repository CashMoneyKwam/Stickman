extends Button

@export var action : String 
@onready var input_mapper = $".."

func _init():
	toggle_mode = true

func _ready():
	set_process_unhandled_input(false)

func _toggled(button_pressed):
	set_process_unhandled_input(button_pressed)
	if button_pressed:
		text = "Awaiting Input"

func _unhandled_input(event):
	if event.pressed:
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)
		button_pressed = false 
		release_focus()
		update_text()
		input_mapper.keymaps[action]

func update_text():
	text = InputMap.action_get_events(action)[0].as_text()
