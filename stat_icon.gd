extends TextureRect

# needs to uh. God.
# like, make a _new_ delta label.
# then play the animation on it.
# instead of this.

# also, not be red for positive changes.

# also use colours from our pallete
func play_delta_anim(delta):
	$current_label/delta_label.text = str(delta);
	$AnimationPlayer.play("delta")
	await $AnimationPlayer.animation_finished
	$current_label/delta_label.text = ""
	
