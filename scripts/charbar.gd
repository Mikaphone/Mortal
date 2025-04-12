extends HBoxContainer
@onready var hp_label = %HpLabel
@onready var select = %Select
@onready var ap_label = %ApLabel


# Called when the node enters the scene tree for the first time.
func sethp(hp, mhp):
	hp_label.set("text", str(hp) + "/" + str(mhp))
func setap(ap, m_ap):
	ap_label.set("text", str(ap) + "/ " + str(m_ap))
