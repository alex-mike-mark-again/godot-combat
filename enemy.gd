extends Battler
class_name Enemy

signal selected

var hpLabel
var atkLabel
var animationPlayer

func _ready():
	super._ready()
	hpLabel = get_node("HP Label")
	atkLabel = get_node("ATK Label")
	animationPlayer = get_node("Sprite2D/AnimationPlayer")
	_update_displays()


func _on_selector_pressed():
	selected.emit(self)

func die():
	super.die()
	hide()

func _update_displays():
	hpLabel.text = str(hp)+"/"+str(mhp)
	atkLabel.text = "atk: "+str(atk)
