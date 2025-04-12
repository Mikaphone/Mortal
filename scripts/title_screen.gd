extends Control
@onready var settings_dialog: SettingsDialog = %SettingsDialog






func _on_quit_pressed() -> void:
	get_tree().quit()



func _on_settings_pressed() -> void:
	settings_dialog.show()



func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	



func _on_load_game_pressed() -> void:
	SaveLoad.load_button_pressed = true
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
