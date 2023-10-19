extends Battler
class_name Enemy

signal selected

@export var hpLabel: Label
@export var atkLabel: Label
@export var buff_display: Control
@export var nameLabel: Label
@export var animationPlayer: AnimationPlayer

@export_group("Buffs")
@export var buff_atk: int
@export var buff_hp: int
@export var buff_rdc: int
@export var buff_max_hp: int

var buff

func _ready():
	super._ready()
	buff = Buff.new(buff_atk, buff_hp, buff_rdc,buff_max_hp)
	nameLabel.text = self.name

	_write_buff_label()
	_resize_labels_to_hug_selector()
	_update_displays({})

# there is probably a nicer way of doing this with
# control/container functions
func _resize_labels_to_hug_selector():
	var _size: Vector2 = $Selector.get_size()
	var _scale: Vector2 = $Selector.get_scale()
	$Labels.size = Vector2(_size.x*_scale.x,_size.y*_scale.y)

func _write_buff_label():
	buff_display.update_display(buff)

func _on_selector_pressed():
	selected.emit(self)

func die():
	super.die()
	animationPlayer.play("death")
	$AudioStreamPlayer2D2.play()
	await animationPlayer.animation_finished # curious about what the implications of using await are.
	hide()

func _update_displays(delta: Dictionary):
	hpLabel.text = "hp: "+str(hp)
	atkLabel.text = "atk: "+str(atk)

func take_damage(damage: int):
	super.take_damage(damage)
	if !dead:
		animationPlayer.play("damage")
		$AudioStreamPlayer2D.play()
		await animationPlayer.animation_finished

func attack_vfx():
	animationPlayer.play("attack")

func _on_selector_mouse_entered():
	buff_display.show()

func _on_selector_mouse_exited():
	buff_display.hide()
