class_name player extends CharacterBody2D

@export var move_speed : float = 125
@export var starting_direction : Vector2 = Vector2(0,1)
# Called when the node enters the scene tree for the first time.

@onready var animation = $AnimationTree
@onready var state_machine = animation.get("parameters/playback")
var can_move = true


@export var statsheet: Stats


func _ready():
	update_animation_parameters(starting_direction)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	update_animation_parameters(input_direction)
	
	if can_move == true:
		velocity = input_direction * move_speed
	if can_move == false:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	pick_new_state()
func update_animation_parameters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animation.set("parameters/Walk/blend_position", move_input)
		animation.set("parameters/Idle/blend_position", move_input)
		
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
