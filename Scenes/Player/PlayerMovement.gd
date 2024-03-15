extends KinematicBody2D

var dir = Vector2.ZERO
var cell_size
export(NodePath) var tilemap_path
var tilemap = null
var animatedSprite
var can_move = true

func _ready():
	animatedSprite = get_node("Sprite").play("idle")
	if tilemap_path:
		tilemap = get_node(tilemap_path)
		if tilemap:
			cell_size = tilemap.cell_size

func _input(event):
	if can_move:
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

func death():
	can_move = false
	animatedSprite = get_node("Sprite").play("death")
	# Create a Timer node
	var pause_timer = Timer.new()
	pause_timer.wait_time = 2.8  # Pause after 2 seconds
	pause_timer.one_shot = true
	add_child(pause_timer)
	pause_timer.start()
	pause_timer.connect("timeout", self, "_on_pause_timeout")

func _on_pause_timeout():
	get_node("Sprite2").hide()
	# Pause all processes in the scene
	get_tree().paused = true
	get_tree().change_scene(str("res://Scenes/Scenery/LoseCond.tscn"))
