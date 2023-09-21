extends Battler

var def
@export var stats: Label

func _ready():
	def = 1
	hp = mhp # i don't wanna be calling this everytime!!!
	# how do we get this to set properly in Battler?
	
	_updateDisplays()

func deal_damage(damage: int):
	hp = max(hp-damage,0)
	
func _updateDisplays():
	stats.text = "❤️ "+str(hp)+"/"+str(mhp)+"\n🗡️ "+str(atk)
