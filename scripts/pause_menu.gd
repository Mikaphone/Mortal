class_name pmenu 
extends Control

@onready var Player: player = %player
@onready var inventory_dialouge: InventoryDialog = %InventoryDialouge
@onready var settings_dialog: SettingsDialog = %SettingsDialog





	
func _on_inventory_button_pressed():
	inventory_dialouge.open(Player.inventory)
	




func _on_exit_button_pressed():
	get_tree().quit()
	print("Exit Worked")


func _on_settings_button_pressed() -> void:
	settings_dialog.show()
