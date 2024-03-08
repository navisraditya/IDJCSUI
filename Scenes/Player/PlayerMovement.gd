extends KinematicBody2D

var dir = Vector2.ZERO
var cell_size

onready var world = get_tree().get_root().find_node("Testing", true, false)
onready var tilemap = world.get_node("TileMap")

func _ready():
	cell_size = tilemap.cell_size
	
func _input(event):
	if event.is_action_pressed("ui_left"):
		dir = Vector2(-1, -1)  # Diagonal movement for isometric left
		print("left")
		move_player()

	if event.is_action_pressed("ui_right"):
		dir = Vector2(1, 1)  # Diagonal movement for isometric right
		print("right")
		move_player()

	if event.is_action_pressed("ui_up"):
		dir = Vector2(1, -1)  # Diagonal movement for isometric up
		print("up")
		move_player()

	if event.is_action_pressed("ui_down"):
		dir = Vector2(-1, 1)  # Diagonal movement for isometric down
		print("down")
		move_player()

func move_player():
	var new_pos = self.position + (dir * cell_size/2)
	var con_pos = convert_pos(new_pos)
	var grid_pos = tilemap.world_to_map(con_pos)  # Convert isometric position to grid position
	var tile_id = tilemap.get_cell(grid_pos.x, grid_pos.y)
	
	if tile_id in tilemap.walkable_tile_id:
		self.position = new_pos
	else:
		print("cannot move there")

func convert_pos(pos: Vector2):
	# Convert Cartesian coordinates to isometric
	var iso_x = (pos.x / cell_size.x + pos.y / cell_size.y) / 2
	var iso_y = (pos.y / cell_size.y - pos.x / cell_size.x) / 2
	return Vector2(iso_x, iso_y)
