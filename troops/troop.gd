extends Control
class_name Troop

var _enemies 

func _ready():
	_enemies = get_children()

func get_enemies():
	return _enemies
