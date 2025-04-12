extends Control

@onready var options: NinePatchRect = %Options
@onready var options_menu: VBoxContainer = %"Options Menu"
@onready var en_bar = %enBar
@onready var char_bar = %charBar
@onready var ally_slot_1 = %AllySlot1
@onready var enemy_slot_1 = %EnemySlot1
@onready var context_label: Label = %ContextLabel
@onready var inventory_dialouge: InventoryDialog = %InventoryDialouge

signal advance

@export var playerturn: bool 
@export var mynode = preload("res://Scenes/attackanimation.tscn")

func _ready():
	ally_slot_1.display()
	enemy_slot_1.display()
	char_bar.sethp(ally_slot_1.gethealth(), ally_slot_1.getmhealth())
	char_bar.setap(ally_slot_1.getap(), ally_slot_1.getm_ap())
	$battlemusic.play()
	start_combat()

func _on_options_menu_button_focused(button: BaseButton) -> void:
	print(button.text)


func _on_options_menu_button_pressed(button: BaseButton) -> void:
	print(button.text)


func start_combat():
	var coinflip :int = randi_range(0,1)
	
	match coinflip : 
		0:
			playerturn = true
		1: 
			playerturn = false
		
	while (ally_slot_1.gethealth() > 0 && enemy_slot_1.gethealth() > 0):
		if playerturn == true:
			context_label.set("text","Its your turn!")
			print("It's the player's turn!")
			options.show()
			await advance
			
		
		else:
			options.hide()
			print("Its the enemy's turn!")
			context_label.set("text","Its the enemy's turn!")
			await get_tree().create_timer(3.0).timeout
			var descisionval : int = randi_range(1,2)
			if descisionval == 1:
				var attackval = randi_range(1,5)
				if ally_slot_1.character.blocking == true:
					attackval = attackval / 2
					ally_slot_1.character.blocking = false
					if attackval < 1:
						attackval = 0
				ally_slot_1.character.take_damage(attackval)
				context_label.set("text","You took " + str(attackval) + " damage!")
				char_bar.sethp(ally_slot_1.gethealth(), ally_slot_1.getmhealth())
				char_bar.setap(ally_slot_1.getap(), ally_slot_1.getm_ap())
				playanimation(Vector2(1000,580))
				await get_tree().create_timer(3.0).timeout
				playerturn = true
			if descisionval == 2: 
				enemy_slot_1.character.blocking = true
				context_label.set("text","The enemy has started to block!")
				$shieldsound.play()
				ally_slot_1.character.blocking = false
				await get_tree().create_timer(3.0).timeout
				playerturn = true
	if ally_slot_1.gethealth() == 0:
		end_combat_lose()
	if enemy_slot_1.gethealth() == 0:
		end_combat_win()


func change_turn(playerturn):
	if playerturn == true:
		playerturn = false
	if playerturn == false:
		playerturn = true

func end_combat_lose():
	context_label.set("text", "You have lost the battle...")
	await get_tree().create_timer(3.0).timeout
	get_tree().quit()

func end_combat_win():
	context_label.set("text", "The enemy has fallen! You win!")
	await get_tree().create_timer(3.0).timeout
	get_tree().quit()


func _on_fight_pressed() -> void:
	var attackval : int = randi_range(1, 7)
	if enemy_slot_1.character.blocking == true:
		attackval = attackval / 2
		enemy_slot_1.character.blocking = false
		if attackval < 1:
			attackval = 0
	enemy_slot_1.character.take_damage(attackval)
	print("Enemy took " + str(attackval) + " damage!")
	context_label.set("text","Enemy took " + str(attackval) + " damage!")
	playanimation(Vector2(1000,580))
	await get_tree().create_timer(3.0).timeout
	options.hide()
	playerturn = false
	emit_signal("advance")




func _on_block_pressed() -> void:
	ally_slot_1.character.blocking = true
	options.hide()
	context_label.set("text", "You block!")
	$shieldsound.play()
	await get_tree().create_timer(3.0).timeout
	playerturn = false
	enemy_slot_1.character.blocking = false
	emit_signal("advance")



func _on_flee_pressed() -> void:
	options.hide()
	var fleeval : int  = randi_range(1, 10)
	if fleeval >= 5:
		context_label.set("text", "You fled!")
		$flee.play()
		await get_tree().create_timer(3.0).timeout
		get_tree().quit()
	if fleeval < 5:
		context_label.set("text", "You were unable to flee!")
		await get_tree().create_timer(3.0).timeout
		playerturn = false
		enemy_slot_1.character.blocking = false
		emit_signal("advance")

func _on_items_pressed() -> void:
	options.hide()
	inventory_dialouge.open(Global.inventory)



func _on_close_button_pressed() -> void:
	inventory_dialouge.hide()
	options.show()



func _on_item_slot_pressed() -> void:
	ally_slot_1.character.heal(5)
	playerturn = false
	enemy_slot_1.character.blocking = false
	context_label.set("text", "You healed for 5 HP!")
	await get_tree().create_timer(3.0).timeout
	emit_signal("advance")

func playanimation(pos):
	var instance = mynode.instantiate()
	instance.position = pos
	if playerturn == false:
		instance.flip()
	add_child(instance)
	instance.playsound()
	await get_tree().create_timer(1.0).timeout
	instance.queue_free()





func _on_battlemusic_finished() -> void:
	$battlemusic.play()
