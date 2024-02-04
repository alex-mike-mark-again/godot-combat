extends TextureRect
class_name BackgroundLayer

@export var scroll_speed: float

func _ready():
	self.material.set_shader_parameter("scroll_speed", scroll_speed)
