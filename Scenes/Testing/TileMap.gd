extends TileMap

var walkable_tile_id = [0]

func check_tile_id(pos: Vector2):
	return get_cellv(pos)


# reference: https://www.youtube.com/watch?v=YAT-1S-78ms
