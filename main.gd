extends Control

@export var bm: BattleManager
@export var troops: Array[Resource]

func _ready():
	pass

func _on_battle_manager_battle_lost():
	$BattleManager/game_over.show()
