extends CanvasLayer

@onready var Player: player  = %player
@onready var inventory_dialouge: InventoryDialog = %InventoryDialouge

func _unhandled_input(event):
	if event.is_action_released("Inventory"):
		inventory_dialouge.open(Global.inventory)


#func _ready():
	#inventory_button.pressed.connect(_on_inventory_button_pressed)
	#exit_button.pressed.connect(_on_exit_button_pressed)
#
#func _on_inventory_button_pressed():
	#inventorypanel.open(player.inventory)
	#
#
#func _on_exit_button_pressed():
	#get_tree().quit()
	#print("Exit Worked")
