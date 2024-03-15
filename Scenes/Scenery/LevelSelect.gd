extends CanvasLayer



func _on_TextureRect_pressed():
	get_tree().change_scene(str("res://Scenes/Levels/Level1.tscn"))


func _on_TextureRect2_pressed():
	get_tree().change_scene(str("res://Scenes/Levels/Level2.tscn"))


func _on_TextureRect3_pressed():
	get_tree().change_scene(str("res://Scenes/Levels/Level3.tscn"))


func _on_TextureRect4_pressed():
	get_tree().change_scene(str("res://Scenes/Levels/Level4.tscn"))


func _on_ExitButton_pressed():
	get_tree().quit()
