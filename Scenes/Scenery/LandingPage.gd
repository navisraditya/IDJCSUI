extends CanvasLayer



func _on_TextureRect_pressed():
	get_tree().change_scene(str("res://Scenes/Scenery/LevelSelect.tscn"))


func _on_TextureButton_pressed():
	get_tree().quit()
