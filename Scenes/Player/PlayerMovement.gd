extends KinematicBody2D

var dir = Vector2.ZERO
var cell_size 

onready var world = get_tree().get_root().find_node("Main", true, false)
onready var tilemap = world.get_node("TileMap")

func _ready():
	cell_size = tilemap.cell_size
	
func _input(event):
	if event.is_action_pressed("ui_left"):
		dir = Vector2.LEFT
		var can_move = check_tile()
		if can_move:
			self.global_position.x -= cell_size.x
		else:
			print("cannot move there")

	if event.is_action_pressed("ui_right"):
		dir = Vector2.RIGHT
		var can_move = check_tile()
		if can_move:
			self.global_position.x += cell_size.x
		else:
			print("cannot move there")

	if event.is_action_pressed("ui_up"):
		dir = Vector2.UP
		var can_move = check_tile()
		if can_move:
			self.global_position.y -= cell_size.y
		else:
			print("cannot move there")

	if event.is_action_pressed("ui_down"):
		dir = Vector2.DOWN
		var can_move = check_tile()
		if can_move:
			self.global_position.y += cell_size.y
		else:
			print("cannot move there")

func check_tile():
	var new_pos = self.global_position + (dir * cell_size)
	var con_pos = convert_pos(new_pos)
	var tile_id = tilemap.check_tile_id(con_pos)
	
	var acceptable_tile = false
	for tile in tilemap.walkable_tile_id:
		if tile_id == tile:
			acceptable_tile = true
		
	if acceptable_tile:
		return true
	else:
		return false

func convert_pos(pos: Vector2):
	var converted = pos - (cell_size * 0.5)
	converted /= cell_size
	return converted

# reference: https://www.youtube.com/watch?v=YAT-1S-78ms
