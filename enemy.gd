extends Battler

signal selected
signal died

var hpLabel
var atkLabel
var dead = false
var animationPlayer

func _ready():
	mhp = 2
	hp = mhp
	hpLabel = get_node("HP Label")
	atkLabel = get_node("ATK Label")
	animationPlayer = get_node("Sprite2D/AnimationPlayer")
	
	hpLabel.text = str(hp)+"/"+str(mhp)
	atkLabel.text = "atk: "+str(atk)


func _on_selector_pressed():
	selected.emit(self)

func deal_damage(damage):
	hp = max(hp-damage,0)
	hpLabel.text = str(hp)+"/"+str(mhp)
	
	if hp == 0:
		die()
		return
		
	animationPlayer.play("damage")
		
func die():
	died.emit(self)
	dead = true
	hide()
	
