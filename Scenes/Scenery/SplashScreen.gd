extends Node2D

# Time to display the splash screen (in seconds)
onready var slide1 = $Splash1
onready var slide2 = $Splash2
onready var slide3 = $Splash3

var timer = Timer.new()

func _ready():
	add_child(timer)
	timer.start(1)
	timer.connect("timeout", self, "_on_timer_timeout")

#	# Start a timer to switch scenes after display_time seconds
#	yield(get_tree().create_timer(display_time), "timeout")
#	get_tree().change_scene("res://path_to_your_main_scene.tscn")

func first_slide():
	slide1.visible = true
	slide2.visible = false
	slide3.visible = false
	
func second_slide():
	slide1.visible = false
	slide2.visible = true
	slide3.visible = false
	
func third_slide():
	slide1.visible = false
	slide2.visible = false
	slide3.visible = true
	
func _on_timer_timeout():
	if slide1.visible == true:
		second_slide()
		timer.start(1)
	elif slide2.visible == true:
		third_slide()
		timer.start(1)
	elif slide3.visible == true:
		timer.start(1)
		get_tree().change_scene("res://Scenes/Scenery/LandingPage.tscn")
