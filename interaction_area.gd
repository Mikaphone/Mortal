class_name InteractionArea
extends Area2D
@onready var Player: player = %player

@export var givenitem: Items



func _on_body_entered(body):
	if body is player:
	
		Player.inventory.add_item(givenitem)
		print("works")
