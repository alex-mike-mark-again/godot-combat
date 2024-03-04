extends Node
class_name BattleManager

var selected = null
var enemies
var currentTroop
var clickOn = true
var packedTroop
@export var player: Node

signal player_won
signal player_lost

func start_battle():
	load_current_troop()

func on_select(e):
	if !clickOn:
		return

	if selected != null && selected.name == e.name:
		await _battle()
		_check_end_of_battle()

	selected = e

func _battle():
	clickOn = false
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
		player_lost.emit()

	if _player_win():
		on_player_stage_win()

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

func on_player_stage_win():
	player.on_victory()
	player_won.emit()

func load_current_troop():
	if currentTroop:
		remove_child(currentTroop)
		currentTroop.queue_free()
	
	currentTroop = packedTroop.instantiate()
	
	add_child(currentTroop)
	move_child(currentTroop,0)
	enemies = currentTroop.get_enemies()
	for enemy in enemies:
		enemy.selected.connect(on_select)
		enemy.died.connect(on_enemy_killed)

func retry():
	player.reset_to_last_save()
	load_current_troop()

func set_troop(newTroop):
	packedTroop = load(newTroop)
