extends Area2D

var background

func _on_ObjLevelUp_body_entered(body):
	if body.get_name() == "Player":
	  print("gas")
	  background = get_parent().get_node("Player/Camera2D/Node2D/ColorRect")
	  background.change_background_color()
