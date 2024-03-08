extends TileMap

var walkable_tile_id = [0]

func check_tile_id(pos: Vector2):
	var iso_pos = cartesian_to_isometric(pos)
	return get_cellv(pos)

func cartesian_to_isometric(pos: Vector2):
	var iso_x = (pos.x - pos.y) / 2
	var iso_y = (pos.x + pos.y) / 2
	return Vector2(iso_x, iso_y)
	
# reference: https://www.youtube.com/watch?v=YAT-1S-78ms
