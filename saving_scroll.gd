extends Node2D

signal save
@onready var interaction_area: Interaction = $"Interaction Area"


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	emit_signal("save")
