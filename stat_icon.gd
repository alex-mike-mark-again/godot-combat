extends TextureRect

# TODO: also use colours from our pallete
func play_delta_anim(delta: int):
	var x = $current_label/delta_label.duplicate()
	$current_label.add_child(x)
	x.text = str(delta);
	if(delta > 0):
		x.add_theme_color_override("font_color", Color.FOREST_GREEN)
		
	x.get_node("AnimationPlayer").play("delta")
	await x.get_node("AnimationPlayer").animation_finished
	x.queue_free()
	
