class_name character_container
extends Control

@export var character : Stats

func _process(delta: float) -> void:
	if character.blocking == true:
		$TextureRect.show()
	if character.blocking == false:
		$TextureRect.hide()

func display():
	self.set("texture_normal", character.texture)
	

func gethealth() -> int:
	return character.hp
func getmhealth() -> int:
	return character.mhp
func getap() -> int:
	return character.ap
func getm_ap() -> int:
	return character.m_ap
func getname() -> String:
	return character.charactername
