extends Area2D

func _on_ObjLevelUp_body_entered(body):
	if body.get_name() == "Player":
		print("obj up")
