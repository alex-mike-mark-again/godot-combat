# some kind of Stats class would be nice.
# would be able to just like. define a block,
# the battler has it. the buff has it. yeah

extends Node2D
class_name Battler

@export var mhp: int
@export var atk = 1
var hp
var dead = false

signal died

func _ready():
	hp = mhp
	
func take_damage(damage: int):
	hp = max(hp-damage,0)
	_update_displays()
	if hp == 0:
		die()

func die():
	dead = true
	died.emit(self)

# pseudo virtual function
func _update_displays():
	pass

func apply_buff(buff: Buff):
	atk += buff.atk
	mhp += buff.mhp
	hp += buff.mhp
	hp = min(hp+buff.hp,mhp)
	_update_displays()
	
func remove_buff(buff: Buff):
	atk -= buff.atk
	mhp -= buff.mhp
	hp = min(hp,mhp)
	_update_displays()
