extends Node2D

@onready var Player: player = %player



func _on_character_body_2d_body_entered(body) -> void:
	if body is player:
		$CharacterBody2D/TextureRect.show()
		$found.play()
		Player.can_move = false
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Scenes/combat.tscn")
	
