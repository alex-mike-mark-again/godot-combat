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

func _ready():
	load_next_battle()
	player = get_node("Player")

func on_select(e):
	selected = e

func _on_go_button_pressed():
	if !selected:
		return
	
	_battle()

func _battle():
	selected.take_damage(player.atk)
	selected = null
	
	for enemy in enemies:
		if !enemy.dead:
			player.take_damage(enemy.atk)
	
	if player.dead:
		get_node("GoButton").hide()
	
	for enemy in enemies:
		if !enemy.dead:
			return
			
	load_next_battle()

func on_enemy_killed(e):
	player.apply_buff(e.buff)

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
			enemy.died.connect(on_enemy_killed)
		battleCount+=1
