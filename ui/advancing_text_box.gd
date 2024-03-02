extends Label
@export var text_list: Array[String]
var text_index = -1

func advance():
	text_index = text_index + 1
	if text_index < text_list.size():
		text = text + text_list[text_index]
	else:
		text = "donezo"
