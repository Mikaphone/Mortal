class_name main extends Node2D
@export var testitem: Items
@onready var pause_menu = $CanvasLayer/PauseMenu
var paused = false

func _process(_delta):
	
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





func _on_pause_button_pressed() -> void:
	pauseMenu()
