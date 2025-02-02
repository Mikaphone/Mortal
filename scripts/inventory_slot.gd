extends Button

@export var stored_item : Items

func display(item:Items):
	setitem(item)
	self.icon = item.texture
	self.text = item.name
	$AmountLabel.text = item.item_amount

func setitem(item: Items):
	stored_item = item
	
