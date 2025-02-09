class_name SettingsDialog
extends PanelContainer



func _on_close_button_pressed() -> void:
	hide()

func _on_resolutions_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(2560,1440))
		1:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		2:
			DisplayServer.window_set_size(Vector2i(1366,768))
		3:
			DisplayServer.window_set_size(Vector2i(1280,720))
