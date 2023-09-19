extends Node

var selected = null
var enemies
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	enemies = get_node("Enemies").get_children()
	player = get_node("Player")
	
	for enemy in enemies:
		enemy.selected.connect(on_select)
	pass # Replace with function body.

func on_select(e):
	selected = e
	print(e.name+" selected")

func _on_go_button_pressed():
	if !selected:
		print("nothing seleted")
		return
	
	_battle()

func _battle():
	print("starting battle")
	selected.deal_damage(player.atk)
	selected = null
	
	for enemy in enemies:
		if !enemy.dead:
			print(enemy.name+" still up")
			return
			
	print("enemies busted")
