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
@export var buff_hp: int
@export var buff_rdc: int

var buff

func _ready():
	buff = Buff.new(buff_atk, buff_hp, buff_rdc)
	nameLabel.text = self.name
	
	_write_buff_label()
	_resize_labels_to_hug_selector()
	_update_displays()

# there is probably a nicer way of doing this with
# control/container functions
func _resize_labels_to_hug_selector():
	var _size: Vector2 = $Selector.get_size()
	var _scale: Vector2 = $Selector.get_scale()
	$Labels.size = Vector2(_size.x*_scale.x,_size.y*_scale.y)
	
func _write_buff_label():
	buffLabel.text = "Grants\n-----\n"+buff.toString()
	
func _on_selector_pressed():
	selected.emit(self)

func die():
	super.die()
	var finished = animationPlayer.animation_finished
	animationPlayer.play("death")
	await finished # curious about what the implications of using await are.
	hide()

func _update_displays():
	hpLabel.text = "hp: "+str(hp)
	atkLabel.text = "atk: "+str(atk)
	
func take_damage(damage: int):
	super.take_damage(damage)
	if !dead:
		animationPlayer.play("damage")
		$AudioStreamPlayer2D.play()
	else:
		$AudioStreamPlayer2D2.play()

func _on_selector_mouse_entered():
	buffLabel.show()


func _on_selector_mouse_exited():
	buffLabel.hide()
