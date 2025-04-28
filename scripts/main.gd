class_name main extends Node2D

@onready var pause_menu = $CanvasLayer/PauseMenu
@onready var Player: player = %player

var paused = false

func _ready() -> void:
	$ambience.play()
	if SaveLoad.load_button_pressed == true:
		load_game()

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


func _on_saving_scroll_save() -> void:
	save_game()

func save_game():
	var saved_game : SavedGame = SavedGame.new()
	var saved_inv : Inventory = Inventory.new()
	saved_game.saved_position = Player.global_position
	saved_game.health = Player.statsheet.hp
	saved_game.action_points = Player.statsheet.ap
	saved_inv = Global.inventory
	
	
	for item in get_tree().get_nodes_in_group("ground_item"):
		saved_game.ground_item_positions.append(item.global_position)
	
	ResourceSaver.save(saved_game,"user://savegame.tres")
	ResourceSaver.save(saved_inv, "user://savedinv.tres")
	
func load_game():
	var saved_game : SavedGame = load("user://savegame.tres")
	var saved_inv : Inventory = load("user://savedinv.tres")
	Player.global_position = saved_game.saved_position
	Player.statsheet.hp = saved_game.health
	Player.statsheet.ap = saved_game.action_points
	Global.inventory = saved_inv
	
	
	for item in get_tree().get_nodes_in_group("ground_item"):
		item.get_parent().remove_child(item)
		item.queue_free()
	for position in saved_game.ground_item_positions:
		preload("res://Scenes/interaction_area.tscn")
	

func _on_pause_menu_load() -> void:
	load_game()
	pauseMenu()


func _on_ambience_finished() -> void:
	$ambience.play()
