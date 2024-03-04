extends Control

@export var bm: BattleManager
@export var scenes: Array[String] #mb just strings?
var current_scene
var scene_index = -1

func _ready():
	$StoryManager.hide()
	_on_next_button_pressed()

func _on_battle_manager_player_lost():
	$game_over.show()

func _on_battle_manager_player_won():
	$StoryManager.show()	
	$next_button.show()

func _on_next_button_pressed():
	load_next_scene() # TODO: hitting next to get to a win screen or a story scene sucks. let's. fix that.
	$StoryManager.hide()	
	$next_button.hide()

func load_next_scene():
	scene_index += 1
	var packed_scene = load(scenes[scene_index])
	var scene_state = packed_scene.get_state()
	print(scene_state.get_node_type(0))
	if(scene_index < scenes.size()):
		bm.set_troop(scenes[scene_index])
		bm.start_battle()
	else: # TODO: we should switch on Battle vs Story scenes. And the game_won scene should be revamped to be a story scene
		get_tree().change_scene_to_file("res://game_won.tscn")
