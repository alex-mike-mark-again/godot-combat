extends Node
class_name Buff

@export var atk = 0
@export var hp = 0
@export var maxHp = 0
@export var rdc = 0

func _init(a,b,c,d):
	self.atk = a
	self.hp = b
	self.rdc = c
	self.maxHp = d

func toString():
	var r = ""
	if hp:
		r+="Light +"+str(hp)+"\n"
	if maxHp:
		r+="Max Light +"+str(maxHp)+"\n"
	if atk:
		r+="Heat +"+str(atk)+"\n"
	if rdc:
		r+="Smoke +"+str(rdc)

	return r

func add(other: Buff):
	return Buff.new(self.atk + other.atk,
		self.hp + other.hp,
		self.rdc + other.rdc,
		self.maxHp + other.maxHp
	)
