extends Area2D

var is_obj

func _on_ObjLevelUp_body_entered(body):
	is_obj = get_parent().get_node("Objective").get_status()
	if body.get_name() == "Player" and is_obj == true:
	  print("gas")
