extends Control
@onready var main = $"."


func _on_pause_button_pressed() -> void:
	main.pauseMenu()
