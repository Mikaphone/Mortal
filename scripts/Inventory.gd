class_name Inventory

var _content:Array[Items] = []

func add_item(item:Items):
	_content.append(item)

func remove_item(item: Items):
	_content.erase(item)


func get_items() -> Array[Items]:
	return _content
