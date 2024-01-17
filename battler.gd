extends Control
class_name Battler

@export var atk = 0 # damages hp
var hp: int
@export var maxHp = 1
@export var rdc = 0 # damages atk
var dead = false

signal died
signal stat_change

func _ready():
	hp = maxHp

func take_damage(damage: int):
	hp = max(hp-damage,0)
	_update_displays({
		"hp": -damage
	})
	if hp == 0:
		die()

func reduce_atk(reduction: int):
	atk = max(atk-reduction,0)
	_update_displays({
		"atk": -reduction
	})

func die():
	dead = true
	died.emit(self)

# pseudo virtual function
func _update_displays(delta: Dictionary):
	pass

func apply_buff(buff: Buff):
	atk += buff.atk
	maxHp += buff.maxHp
	hp = min(hp+buff.hp,maxHp)
	rdc += buff.rdc
	_update_displays({
		"atk": buff.atk,
		"maxHp": buff.maxHp,
		"hp": buff.hp, 
		"rdc": buff.rdc
	})

func remove_buff(buff: Buff):
	atk -= buff.atk
	maxHp -= buff.maxHp
	hp = min(hp, maxHp)
	rdc -= buff.rdc
	_update_displays({
		"atk": -buff.atk,
		"maxHp": -buff.maxHp,
		"hp": -buff.hp, 
		"rdc": -buff.rdc
	})
