class_name status_dialog
extends PanelContainer

@onready var Player: player = %player




func _on_close_button_pressed() -> void:
	hide()
	

func _process(delta: float) -> void:
	if self.visible:
		%LevelValue.set("text", str(Player.statsheet.level))
		%HealthValues.set("text", str(Player.statsheet.hp)+"/"+str(Player.statsheet.mhp))
		%APValues.set("text", str(Player.statsheet.ap)+"/"+str(Player.statsheet.m_ap))
	
