extends Control

onready var  ResOptionButton = $HBoxContainer/OptionButton

var Resolutions: Dictionary = {"3840x2160":Vector2(3840,2160),
								"2560x1440":Vector2(2560,1440),
								"1920x1080":Vector2(1920,1080),
								"1366x768":Vector2(1366,768),
								"1536x864":Vector2(1536,864),
								"1280x720":Vector2(1280,720),
								"1440x900":Vector2(1440,900),
								"1600x900":Vector2(1600,900),
								"1024x600":Vector2(1024,600),
								"800x600":Vector2(800,600)}
							
func _ready():
	 AddResolutions()
	
	
func AddResolutions():
	for r in Resolutions
		ResOptionButton.add_item(r)
		

