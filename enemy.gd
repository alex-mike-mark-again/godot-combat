extends Battler
class_name Enemy

signal selected

@export_group("Buffs")
@export var buff_atk: int
@export var buff_mhp: int
@export var buff_hp: int

var buff
var hpLabel
var atkLabel
var buffLabel
var animationPlayer

func _ready():
	super._ready()
	buff = Buff.new(buff_atk, buff_mhp, buff_hp)
	hpLabel = get_node("HP Label")
	atkLabel = get_node("ATK Label")
	buffLabel = get_node("Buff Label")	
	animationPlayer = get_node("Sprite2D/AnimationPlayer")
	_write_buff_label()
	_update_displays()

func _write_buff_label():
	buffLabel.text = "Gives the following on defeat:\n"+buff.toString()
	
func _on_selector_pressed():
	selected.emit(self)

func die():
	super.die()
	hide()

func _update_displays():
	hpLabel.text = str(hp)+"/"+str(mhp)
	atkLabel.text = "atk: "+str(atk)
	
func take_damage(damage: int):
	super.take_damage(damage)
	animationPlayer.play("damage")

func _on_selector_mouse_entered():
	buffLabel.show()


func _on_selector_mouse_exited():
	buffLabel.hide()
