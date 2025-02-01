class_name Inventory

var _content: Array[Items] = []

func add_item(item:Items, amount: int):
	if _content.has(item):
		item.item_amount += amount
	else:
		_content.append(item)

func remove_item(item: Items, amount: int):
	if item.item_amount <= 1:
		_content.erase(item)
	else: 
		item.item_amount -= amount

func get_items() -> Array[Items]:
	return _content
