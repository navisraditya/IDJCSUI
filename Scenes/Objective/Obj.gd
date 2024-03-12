extends Area2D

export var levelUp = "abc"

func _on_Objective_body_entered(body):
	print("yey obj")
	if body.get_name() == "Player":
		get_tree().change_scene(str(levelUp))
