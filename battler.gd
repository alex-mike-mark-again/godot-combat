extends Node2D
class_name Battler

@export var mhp: int
@export var atk = 1
var hp

func _ready():
	hp = mhp
