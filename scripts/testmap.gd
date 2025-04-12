class_name loc_code extends Node2D

@export var loc_name : String = "Test Dungeon"
@onready var player: player = %player

signal loc_change

func _on_location_area_body_entered(body: Node2D) -> void:
	if body is player:
		emit_signal("loc_change", loc_name)
