extends TileMap

var walkable_tile_ids = [0]

func check_tile_id(pos: Vector2):
	return get_cellv(pos)
