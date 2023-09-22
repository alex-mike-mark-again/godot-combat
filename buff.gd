extends Node
class_name Buff

@export var atk = 0
@export var mhp = 0
@export var hp = 0

func _init(a,b,c):
	self.atk = a
	self.mhp = b
	self.hp = c

func toString():
	var r = ""
	if atk:
		r+="atk +"+str(atk)+"\n"
	if mhp:
		r+="mhp +"+str(mhp)+"\n"
	if hp:
		r+="hp +"+str(hp)+"\n"
		
	return r
	
