extends Control
class_name StoryManager

@export var atb: Node

func set_story(story):
	atb.set_text_list(story)

func start_story_scene():
	self.show()
	atb.reset()
	atb.advance()

func _on_next_line_button_pressed():
	atb.advance() # Replace with function body.


func _on_next_stage_button_pressed():
	self.hide() # Replace with function body.

# TODO: you can advance text while the atb isn't shown.
# maybe fix that. seems kinda weird but not terribad
func _on_hide_button_toggled(button_pressed):
	if (button_pressed):
		atb.hide()
		$button_deck/hide_button.text = "0_0"
	else:
		atb.show()
		$button_deck/hide_button.text = "X_X"
		
