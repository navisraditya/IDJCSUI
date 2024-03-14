extends Area2D

var background
var modulation
var lighty

func _on_Objective_body_entered(body):
	if body.get_name() == "Player":
		print("oke")
		background = get_parent().get_node("Player/Camera2D/Node2D/ColorRect")
		modulation = get_parent().get_node("CanvasModulate")
		lighty = get_parent().get_node("Player/Light2D")
		background.change_background_color()
		modulation.color = Color(0,0,0,1)
		lighty.enabled = true
