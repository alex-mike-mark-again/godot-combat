extends Node
class_name Buff

@export var atk = 0
@export var hp = 0

func _init(a,b):
	self.atk = a
	self.hp = b

func toString():
	var r = ""
	if atk:
		r+="atk +"+str(atk)+"\n"
	if hp:
		r+="hp +"+str(hp)+"\n"
		
	return r
