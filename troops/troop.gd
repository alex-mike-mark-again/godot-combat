extends Node2D
class_name Troop

var width = 400
var y = 100

func _ready():
	var enemies = get_children()
	for enemy in enemies:
		enemy.position = Vector2(enemy.position.x+150,y)
	
