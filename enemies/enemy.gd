extends Battler
class_name Enemy

signal selected

@export var hpLabel: Label
@export var atkLabel: Label
@export var buffLabel: Label
@export var nameLabel: Label
@export var animationPlayer: AnimationPlayer

@export_group("Buffs")
@export var buff_atk: int
@export var buff_mhp: int
@export var buff_hp: int
var buff

func _ready():
	super._ready()
	buff = Buff.new(buff_atk, buff_mhp, buff_hp)
	nameLabel.text = self.name
	
	_write_buff_label()
	_resize_labels_to_hug_selector()
	_update_displays()

# there is probably a nicer way of doing this with
# control/container functions
func _resize_labels_to_hug_selector():
	var size: Vector2 = $Selector.get_size()
	var scale: Vector2 = $Selector.get_scale()
	$Labels.size = Vector2(size.x*scale.x,size.y*scale.y)
	
func _write_buff_label():
	buffLabel.text = "Grants\n-----\n"+buff.toString()
	
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
