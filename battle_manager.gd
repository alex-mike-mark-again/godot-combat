extends Node

var selected = null
var enemies
var player
var globals
var currentTroop
var battleCount = 0
var turnsTaken = 0
var clickOn = true

var troops = [
#	"res://troops/three_dudes.tscn",
#	"res://troops/one_dude.tscn",
#	"res://troops/two_dudes.tscn",
	"res://troops/stage1b.tscn",
	"res://troops/stage2b.tscn",
#	"res://troops/stage3.tscn",
]

func _ready():
	advance_to_next_stage()
	player = get_node("../Player")
	globals = get_node("/root/Globals")

func on_select(e):
	if !clickOn:
		return
		
	if selected != null && selected.name == e.name:
		await _battle()
		_check_end_of_battle()
	
	selected = e

func _battle():
	clickOn = false
	turnsTaken += 1
	selected.take_damage(player.atk)
	selected.reduce_atk(player.rdc)
	await selected.animationPlayer.animation_finished
	selected = null # works, but doesn't like. un activate the button.
	
	for enemy in enemies:
		if !enemy.dead && enemy.atk:
			enemy.attack_vfx()
			await enemy.animationPlayer.animation_finished
			player.take_damage(enemy.atk)
	
	clickOn = true	
	
func _check_end_of_battle():
	if player.dead:
		get_tree().change_scene_to_file("res://game_over.tscn")
		
	if _player_win():
		player.on_victory()
		if !advance_to_next_stage(): #this is kinda weird looking
			globals.finalTurns = turnsTaken
			globals.finalLight = player.hp
			get_tree().change_scene_to_file("res://game_won.tscn")

func _player_win():
	return _all_enemies_killed()

func _all_enemies_killed():
	var r = true
	for enemy in enemies:
		if !enemy.dead:
			r = false
	
	return r

func on_enemy_killed(e):
	player.apply_buff(e.buff)

func advance_to_next_stage():
	# get rid of defeated troop
	if currentTroop:
		remove_child(currentTroop)
		currentTroop.queue_free()
	
	# if there are troops left, load 'em.
	if battleCount < troops.size():
		# THIS chunk is what loads the next battle.
		currentTroop = load(troops[battleCount]).instantiate()
		add_child(currentTroop) #oh. almost certainly loads this. under the player
		enemies = currentTroop.get_enemies()
		for enemy in enemies:
			enemy.selected.connect(on_select)
			enemy.died.connect(on_enemy_killed)
		battleCount+=1
		return true
	else:
		return false
		
