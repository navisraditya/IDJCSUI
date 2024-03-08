extends ColorRect

func _ready():
	self.color = Color(1.0, 1.0, 1.0, 1.0)

func change_background_color():
	self.color = Color(randf(), randf(), randf(), 1.0)


func _input(event):
	if event.is_action_pressed("ZAP!"):
		change_background_color()
