extends Node
class_name SavingSystem

@onready var Player = get_tree().get_first_node_in_group("playergroup")

var load_button_pressed = false


func save_game():
	var saved_game : SavedGame = SavedGame.new()
	
	saved_game.saved_position = Player.global_position
	saved_game.health = Player.statsheet.hp
	saved_game.action_points = Player.statsheet.ap
	saved_game.saved_inventory = Global.inventory
	
	for item in get_tree().get_nodes_in_group("ground_item"):
		saved_game.ground_item_positions.append(item.global_position)
	
	ResourceSaver.save(saved_game,"res://savegame.tres")
	
func load_game():
	var saved_game : SavedGame = load("res://savegame.tres")
	Player.global_position = saved_game.saved_position
	Player.statsheet.hp = saved_game.health
	Player.statsheet.ap = saved_game.action_points
	Global.inventory = saved_game.saved_inventory
	
	for item in get_tree().get_nodes_in_group("ground_item"):
		item.get_parent().remove_child(item)
		item.queue_free()
	for position in saved_game.ground_item_positions:
		preload("res://Scenes/interaction_area.tscn")

func load_signal():
	emit_signal("loadbutton")
