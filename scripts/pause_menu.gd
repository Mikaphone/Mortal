class_name pmenu 
extends Control

@onready var Player: player = %player
@onready var inventory_dialouge: InventoryDialog = %InventoryDialouge




	
func _on_inventory_button_pressed():
	inventory_dialouge.open(Player.inventory)


func _on_exit_button_pressed():
	get_tree().quit()
	print("Exit Worked")
