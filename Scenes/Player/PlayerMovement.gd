extends KinematicBody2D

var dir = Vector2.ZERO
var cell_size
var tilemap

func _ready():
	tilemap = $"/root/Testing/TileMap"
	cell_size = tilemap.cell_size

func _input(event):
	if event.is_action_pressed("ui_left"):
		dir = Vector2(-1, -1)  # Diagonal movement for isometric left
		move_player()

	if event.is_action_pressed("ui_right"):
		dir = Vector2(1, 1)  # Diagonal movement for isometric right
		move_player()

	if event.is_action_pressed("ui_up"):
		dir = Vector2(1, -1)  # Diagonal movement for isometric up
		move_player()

	if event.is_action_pressed("ui_down"):
		dir = Vector2(-1, 1)  # Diagonal movement for isometric down
		move_player()

func move_player():
	var new_pos = self.position + (dir * cell_size / 2)
	var con_pos = convert_to_tilemap_pos(new_pos)
	var tile_id = tilemap.get_cellv(con_pos)
	
	if tile_id in tilemap.walkable_tile_ids:
		self.position = new_pos
	else:
		print("Cannot move there")

func convert_to_tilemap_pos(pos: Vector2):
	# Convert Cartesian coordinates to tilemap coordinates
	var tilemap_origin = tilemap.world_to_map(Vector2.ZERO)
	var tilemap_pos = tilemap.world_to_map(pos)
	return tilemap_pos - tilemap_origin
