extends Control

@onready var options: NinePatchRect = %Options
@onready var options_menu: VBoxContainer = %"Options Menu"
@onready var enemy_select: VBoxContainer = %"Enemy Select"
@onready var ally_select: VBoxContainer = %"Ally Select"
@onready var en_bar = %enBar
@onready var char_bar = %charBar
@onready var ally_slot_1 = %AllySlot1
@onready var enemy_slot_2 = %EnemySlot2
@onready var enemy_slot_1 = %EnemySlot1
@onready var enemy_slot_3 = %EnemySlot3

@export var turn_order : Array

func _ready() -> void: 
	
	ally_slot_1.display()
	
	set_turns()


func set_turns() -> void:
	pass
	

func _on_options_menu_button_focused(button: BaseButton) -> void:
	print(button.text)


	
func _on_options_menu_button_pressed(button: BaseButton) -> void:
	print(button.text)
