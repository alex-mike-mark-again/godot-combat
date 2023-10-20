extends TextureRect

# needs to uh. God.
# like, make a _new_ delta label.
# then play the animation on it.
# instead of this.
# also, not be red for positive changes.

# also use colours from our pallete
func play_delta_anim(delta: int):
	var x = $current_label/delta_label.duplicate()
	$current_label.add_child(x)
	x.text = str(delta);
	x.get_node("AnimationPlayer").play("delta")
	await x.get_node("AnimationPlayer").animation_finished
	x.free()
	
