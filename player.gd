extends Battler
class_name Player

var tempBuffs: Array

func _ready():
	super._ready()
	_update_displays({})
	
func _update_displays(delta: Dictionary):
	# so, this should be an animation that we don't wait on for sure.
	$light_icon/current_label.text = str(hp)+"/"+str(maxHp)
	$heat_icon/current_label.text = str(atk)
	$smoke_icon/current_label.text = str(rdc)
	
	if delta.get("hp"):
		$light_icon.play_delta_anim(delta.hp)
	if delta.get("atk"):
		$heat_icon.play_delta_anim(delta.atk)
	if delta.get("rdc"):
		$smoke_icon.play_delta_anim(delta.rdc)

func on_victory():
	_gain_permanent_buffs()

func apply_buff(buff: Buff):
	tempBuffs.append(buff)
	super.apply_buff(buff)
	
func _gain_permanent_buffs():
	var removals = tempBuffs.size() - 1
	for i in removals:
		remove_buff(tempBuffs[i])
	
	clear_buffs()

func clear_buffs():
	tempBuffs = []
