extends Button

func display(item:Items):
	self.icon = item.texture
	self.text = item.name
	$AmountLabel.text = item.item_amount
