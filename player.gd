extends Battler
class_name Player

@export var light_display: Label
@export var heat_display: Label
@export var smoke_display: Label

var tempBuffs: Array
var ash = 1 # determines how many buffs you get to keep after a stage. secret

func _ready():
	super._ready()
	_update_displays()
	
func _update_displays():
	# so, this should be an animation that we don't wait on for sure.
	light_display.text = str(hp)+"/"+str(maxHp)
	heat_display.text = str(atk)
	smoke_display.text = str(rdc)

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
