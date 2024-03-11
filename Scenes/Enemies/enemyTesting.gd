extends KinematicBody2D

var dir = Vector2.ZERO
var cell_size
export(NodePath) var tilemap_path
var tilemap = null
var randomInteger

func _ready():
	if tilemap_path:
		tilemap = get_node(tilemap_path)
		if tilemap:
			cell_size = tilemap.cell_size
			
func _process(delta):
	random_movement()

func random_movement():
	randomInteger = randi() % 4
	
	if randomInteger == 0:
		moveDown()
	elif randomInteger == 1:
		moveLeft()
	elif randomInteger == 2:
		moveRight()
	elif randomInteger == 3:
		moveUp()

func moveLeft():
	dir = Vector2(-1, -1)  # Diagonal movement for isometric left
	move_enemy()
	
func moveRight():
	dir = Vector2(1, 1)  # Diagonal movement for isometric right
	move_enemy()
	
func moveUp():
	dir = Vector2(1, -1)  # Diagonal movement for isometric up
	move_enemy()

func moveDown():
	dir = Vector2(-1, 1)  # Diagonal movement for isometric down
	move_enemy()

func move_enemy():
	if tilemap:
		var new_pos = self.position + (dir * cell_size / 2)
		var con_pos = convert_to_tilemap_pos(new_pos)
		var tile_id = tilemap.get_cellv(con_pos)
		
		if tile_id in tilemap.walkable_tile_ids:
			self.position = new_pos
		else:
			random_movement()
	else:
		print("Tilemap not assigned.")

func convert_to_tilemap_pos(pos: Vector2):
	if tilemap:
		var tilemap_origin = tilemap.world_to_map(Vector2.ZERO)
		var tilemap_pos = tilemap.world_to_map(pos)
		return tilemap_pos - tilemap_origin
	else:
		print("Tilemap not assigned.")
		return Vector2.ZERO
