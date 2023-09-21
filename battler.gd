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
	died.emit(self)
	dead = true

# pseudo virtual function
func _update_displays():
	pass
