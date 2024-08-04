extends Control

@export var light_label: Label
@export var heat_label: Label
@export var smoke_label: Label

func update_display(buff: Buff):
	if(buff.hp || buff.maxHp):
		light_label.text = ""
		if(buff.hp > 0):
			light_label.text += "+"+str(buff.hp)+"/"
		else:
			light_label.text += str(buff.hp)+"/"
		
		if(buff.maxHp > 0):
			light_label.text += "+"+str(buff.maxHp)
		else:
			light_label.text += str(buff.maxHp)
		$HBoxContainer/light.show()
	if(buff.atk):
		$HBoxContainer/heat.show()
		if(buff.atk > 0):
			heat_label.text = "+"+str(buff.atk)
		else:
			heat_label.text = str(buff.atk)
	if(buff.rdc):
		$HBoxContainer/smoke.show()
		if(buff.rdc > 0):
			smoke_label.text = "+"+str(buff.rdc)
		else:
			smoke_label.text = str(buff.rdc)
