extends Area2D

var background

func _on_Objective_body_entered(body):
	if body.get_name() == "Player":
	  print("oke")
	  background = get_parent().get_node("Player/Camera2D/Node2D/ColorRect")
	  background.change_background_color()
