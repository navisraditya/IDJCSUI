extends Area2D

var background
var nextObj
var status = false

func _on_Objective_body_entered(body):
	nextObj = get_parent().get_node("ObjLevelUp")
	if body.get_name() == "Player":
		status = true
		print("oke")
		nextObj.show()
		self.hide()

func get_status():
	return status
