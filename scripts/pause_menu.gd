class_name pmenu 
extends Control

signal load

@onready var Player: player = %player
@onready var inventory_dialouge: InventoryDialog = %InventoryDialouge
@onready var settings_dialog: SettingsDialog = %SettingsDialog
@onready var Status_dialog: status_dialog = %StatusDialog





	
func _on_inventory_button_pressed():
	inventory_dialouge.open(Global.inventory)
	




func _on_exit_button_pressed():
	get_tree().quit()
	print("Exit Worked")


func _on_settings_button_pressed() -> void:
	settings_dialog.show()


func _on_status_button_pressed() -> void:
	Status_dialog.show()


func _on_load_button_pressed() -> void:
	emit_signal("load")
