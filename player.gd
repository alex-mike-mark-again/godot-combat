extends Battler
class_name Player

var tempBuffs: Array
var _save

func _ready():
	super._ready()
	_save = get_stats()
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
	_save = get_stats()
	

func apply_buff(buff: Buff):
	tempBuffs.append(buff)
	super.apply_buff(buff)
	
func _gain_permanent_buffs():
	var removals = tempBuffs.size() - 1
	var bigRemoval = Buff.new(0,0,0,0)
	# TODO: add buffs together
	# then remove them all at once?
	for i in removals:
		bigRemoval = bigRemoval.add(tempBuffs[i])
	
	remove_buff(bigRemoval)
	clear_buffs()

func clear_buffs():
	tempBuffs = []
	
func reset_to_last_save():
	set_stats(_save)
	clear_buffs()
	dead = false
	_update_displays({})
	pass
