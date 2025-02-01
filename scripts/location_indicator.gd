class_name indicator_code extends Control



func _on_testers_dungeon_loc_change(locname : String) -> void:
	$location_text.set("text",locname)
