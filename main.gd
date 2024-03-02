extends Control

@export var bm: BattleManager
@export var scenes: Array[Resource] #mb just strings?

func _ready():
	$BattleManager/next_button.hide()

func _on_battle_manager_player_lost():
	$BattleManager/game_over.show()

func _on_battle_manager_player_won():
	$BattleManager/next_button.show()
