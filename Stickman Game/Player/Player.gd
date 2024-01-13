extends CharacterBody2D

class_name PlayerCharacter

@export var speed_multiplier: int = 1 
@export var player_id = 1 

@onready var anim = $CollisionShape2D/PlayerAnim

func _ready():
	anim.play("Idle")


var move_speed: float = 400
const SPEED = 400
	
func _physics_process(delta: float) -> void:
	move()
	
func move():
	var movement: Vector2 = Vector2.ZERO 
#if Input.is_action_pressed("move_right_%s" % [player_id]): movement.x -= 1.0 

	
	if Input.is_action_just_pressed("move_left_1"): anim.play("Jump1")
	if Input.is_action_just_released("move_left_1"): anim.play("Idle")
#else: anim.play("Idle")


	if Input.is_action_just_pressed("move_left_%s" % [player_id]): movement.x += 1.0
	
#if Input.is_action_pressed("move_left_1"): anim.play("Jump1")
#else: anim.play("Idle")
	 
	if move_speed == 1: 
		anim.play("Jump1")
	
	if move_speed == 0: 
		anim.play("Idle")
	
	#var direction := Input.get_axis("ui_left", "ui_right")
	##if movement:
		##velocity.x = movement * SPEED
		##anim.play("Jump1")
	##else:
		##velocity.x = move_toward(velocity.x, 0, move_speed)
		##anim.play("Idle")
		
	
	velocity = movement * (move_speed * speed_multiplier) 
	move_and_slide()	
	
	
	
