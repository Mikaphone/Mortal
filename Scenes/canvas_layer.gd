extends CanvasLayer

@onready var exit_button: Button = $MarginContainer/VBoxContainer/ExitButton
@onready var inventory_button: Button = $MarginContainer/VBoxContainer/InventoryButton
@onready var inventorypanel: InventoryPanel = %Inventory
@onready var player: player = %player
@onready var pause_menu: pmenu = %PauseMenu

func _ready():
	inventory_button.pressed.connect(_on_inventory_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)

func _on_inventory_button_pressed():
	inventorypanel.open(player.inventory)
	

func _on_exit_button_pressed():
	get_tree().quit()
	print("Exit Worked")
