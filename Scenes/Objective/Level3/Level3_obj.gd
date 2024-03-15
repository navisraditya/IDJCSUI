extends Area2D

var background
var modulation
var lighty
var lighty1
var nextObj
var status = false

func _on_Objective_body_entered(body):
	nextObj = get_parent().get_node("ObjLevelUp")
	background = get_parent().get_node("Player/Camera2D/Node2D/ColorRect")
	modulation = get_parent().get_node("CanvasModulate")
	lighty = get_parent().get_node("Player/Light2D")
	lighty1 = get_parent().get_node("ObjLevelUp/Light2D")
	if body.get_name() == "Player" and status == false:
		status = true
		
		nextObj.show()
		background.change_background_color()
		modulation.color = Color(0,0,0,1)
		lighty.enabled = true
		lighty1.enabled = true
		
		print("oke")
		
		self.hide()

func get_status():
	return status
