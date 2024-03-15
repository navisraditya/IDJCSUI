extends Node

# Export the scene to load
export(String, FILE, "*.tscn") var scene_to_load

# Function to load the scene
func load_scene():
	if scene_to_load != "":
		# Load the scene
		var scene_path = scene_to_load
		get_tree().change_scene(scene_path)
