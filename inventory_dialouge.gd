class_name InventoryDialog
extends PanelContainer

@export var slot_scene: PackedScene
@onready var item_list: VBoxContainer = %ItemList

func _on_close_button_pressed():
	hide()

func open(inventory: Inventory):
	show()
	
	for child in item_list.get_children():
		child.queue_free()
	
	for item in inventory.get_items():
		var slot = slot_scene.instantiate()
		item_list.add_child(slot)
		slot.display(item)
