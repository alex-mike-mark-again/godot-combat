extends Control

@export var bm: BattleManager
@export var scenes: Array[Resource] #mb just strings?

func _ready():
	$next_button.hide()

func _on_battle_manager_player_lost():
	$game_over.show()

func _on_battle_manager_player_won():
	$next_button.show()


func _on_next_button_pressed():
	$next_button.hide() # Replace with function body.
