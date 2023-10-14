extends Control

func _ready():
	$Label.text = "A winner is you!\nLight: "+str(get_node("/root/Globals").finalLight)+" | Turns: "+str(get_node("/root/Globals").finalTurns)
