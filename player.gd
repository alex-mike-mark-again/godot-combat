extends Battler
class_name Player

@export var stats: Label

func _ready():
	super._ready()
	
	_update_displays()
	
func _update_displays():
	stats.text = "HP: "+str(hp)+"/"+str(mhp)+"\nATK: "+str(atk)

func apply_buff(buff: Buff):
	atk += buff.atk
	mhp += buff.mhp
	hp += buff.mhp
	hp = min(hp+buff.hp,mhp)
	_update_displays()
