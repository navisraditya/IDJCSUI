extends Area2D

func _on_Obj_body_entered(body):
	if body.get_name() == "Player":
		print("obj")
