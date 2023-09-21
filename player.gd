extends Battler
class_name Player

@export var stats: Label

func _ready():
	super._ready()
	
	_update_displays()
	
func _update_displays():
	stats.text = "❤️ "+str(hp)+"/"+str(mhp)+"\n🗡️ "+str(atk)
