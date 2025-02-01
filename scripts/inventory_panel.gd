class_name InventoryPanel
extends Panel

@export var slot_scene: PackedScene

@onready var v_box_container: VBoxContainer = $All/VBoxContainer

func open(inventory:Inventory):
	show()
	
	for item in inventory.get_items():
		var slot = slot_scene.instantiate()
		v_box_container.add_child(slot)
		slot.display(item)
		
		
