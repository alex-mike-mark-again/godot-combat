extends Label
@export var text_list: Array[String]
var text_index = -1
var end_text = "Escaped. Nextscaped.\nWe're over, hoser."

func advance():
	text_index = text_index + 1
	if text_index < text_list.size():
		text = " ".join([text,text_list[text_index].c_unescape()])
	else:
		text = end_text
