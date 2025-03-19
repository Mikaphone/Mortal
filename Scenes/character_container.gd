class_name character_container
extends Control

@export var character : Stats

func display():
	self.set("texture_normal", character.texture)
	
