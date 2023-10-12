extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")

func _on_show_rules_button_pressed():
	$Rules.show()
