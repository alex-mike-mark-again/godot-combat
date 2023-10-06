extends Battler
class_name Player

@export var stats: Label
var tempBuffs: Array

func _ready():
	_update_displays()
	
func _update_displays():
	stats.text = "[LIGHT: "+str(hp)+"| HEAT: "+str(atk)+"| SMOKE: "+str(rdc)+"]"
	
func apply_buff(buff: Buff):
	tempBuffs.append(buff)
	super.apply_buff(buff)
	
func apply_permanent_buff(buff: Buff):
	for temp in tempBuffs:
		remove_buff(temp)
		
	tempBuffs = []
	super.apply_buff(buff)
