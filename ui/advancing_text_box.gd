extends Label
@export var text_list: Array[String]
var text_index = -1
var end_text = "Escaped. Nextscaped.\nWe're over, hoser."
# TODO some kind of indicator that there is more text would be cool.

func advance():
	text_index = text_index + 1
	if text_index < text_list.size():
		text = " ".join([text,text_list[text_index].c_unescape()])

func set_text_list(list):
	text_list = list

func reset():
	text = ""
	text_index = -1
