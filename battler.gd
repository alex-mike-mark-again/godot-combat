extends Control
class_name Battler

@export var atk = 0 # damages hp
var hp: int
@export var maxHp = 1
@export var rdc = 0 # damages atk
var dead = false

signal died

func _ready():
	hp = maxHp

func take_damage(damage: int):
	hp = max(hp-damage,0)
	_update_displays()
	if hp == 0:
		die()

func reduce_atk(reduction: int):
	atk = max(atk-reduction,0)
	_update_displays()

func die():
	dead = true
	died.emit(self)

# pseudo virtual function
func _update_displays():
	pass

func apply_buff(buff: Buff):
	atk += buff.atk
	maxHp += buff.maxHp
	hp = min(hp+buff.maxHp+buff.hp,maxHp)
	rdc += buff.rdc
	_update_displays()

func remove_buff(buff: Buff):
	atk -= buff.atk
	maxHp -= buff.maxHp
	hp = min(hp, maxHp)
	rdc -= buff.rdc

	_update_displays()
