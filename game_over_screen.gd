extends Control

@export var battle_manager: BattleManager

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_button_2_pressed():
	battle_manager.retry()
	hide()
