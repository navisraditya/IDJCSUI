extends ColorRect

var isWhite = true

func change_background_color():
	if isWhite == true:
		self.color = Color(0, 0, 0, 1.0)
		isWhite = false
	else:
		self.color = Color(1.0, 1.0, 1.0, 1.0)
		isWhite = true

#func _input(event):
#	if event.is_action_pressed("ZAP!"):
#		change_background_color()
