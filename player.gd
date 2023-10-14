extends Battler
class_name Player

@export var stats: Label
var tempBuffs: Array
var ash = 1 # determines how many buffs you get to keep after a stage. secret

func _ready():
	super._ready()
	_update_displays()
	
func _update_displays():
	# so, this should be an animation that we don't wait on for sure.
	stats.text = "[LIGHT: "+str(hp)+"| HEAT: "+str(atk)+"| SMOKE: "+str(rdc)+"]"

func on_victory():
	_gain_permanent_buffs()

func apply_buff(buff: Buff):
	tempBuffs.append(buff)
	super.apply_buff(buff)
	
func _gain_permanent_buffs():
	var removals = tempBuffs.size() - ash
	for i in removals:
		remove_buff(tempBuffs[i])
	
	tempBuffs = []
