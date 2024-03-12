extends Node

class_name TurnQueue

var current_turn

func _ready():
	current_turn = 0
	start_next_turn()

func start_next_turn():
	var next_turn_node = get_child(current_turn % get_child_count())
	next_turn_node.play_turn()
	current_turn += 1
