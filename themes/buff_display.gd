extends Control

@export var light_label: Label
@export var heat_label: Label
@export var smoke_label: Label

func update_display(buff: Buff):
	if(buff.hp || buff.maxHp):
		$HBoxContainer/light.show()
		light_label.text = "+"+str(buff.hp)+"/"+"+"+str(buff.maxHp)
	if(buff.atk):
		$HBoxContainer/heat.show()
		heat_label.text = "+"+str(buff.atk)
	if(buff.rdc):
		$HBoxContainer/smoke.show()
		smoke_label.text = "+"+str(buff.rdc)
