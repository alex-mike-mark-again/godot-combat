extends Node

var selected = null
var enemies
var player
var currentTroop
var battleCount = 0

var troops = [
	"res://troops/one_dude.tscn",
	"res://troops/three_dudes.tscn",
]
# Called when the node enters the scene tree for the first time.
func _ready():
	load_next_battle()
	player = get_node("Player")

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
	load_next_battle()

func load_next_battle():
	if currentTroop:
		remove_child(currentTroop)
		currentTroop.queue_free()
		
	if battleCount < troops.size():
		currentTroop = load(troops[battleCount]).instantiate()
		add_child(currentTroop)
		enemies = currentTroop.get_children()
		for enemy in enemies:
			enemy.selected.connect(on_select)
		battleCount+=1
	else:
		print("No more battles!")
