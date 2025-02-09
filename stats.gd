class_name stats
extends Resource

@export_category("General")
@export var charactername : String
@export var level : int
@export var mhp: int
@export var hp: int
@export var m_ap: int
@export var ap: int
@export_category("Starting_Stats")
@export var startingstrength: int
@export var startingdex : int
@export var startingcon : int
@export var startingintel : int
@export var startingwis : int
@export var startingchar : int


var strength : int
var dex : int
var con : int
var intel : int
var wis : int
var char : int

func set_stat(stat: int, startingstat: int, level: int ):
	pass
	
func take_damage(damage: int) -> void:
	hp -= damage
	if hp < 0:
		hp = 0

func consume_ap(cost : int) -> void: 
	ap -= cost
	if ap < 0:
		ap = 0

func heal (healed : int) -> void:
	hp += healed
	if hp > mhp:
		hp = mhp 

func gain_ap(gained : int) -> void: 
	ap += gained
	if ap > m_ap:
		ap = m_ap
