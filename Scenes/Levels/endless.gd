extends Node2D

onready var label = $Player/Camera2D/Label
onready var obj_list = [$Objective, $Objective2, $Objective3, $Objective4]
onready var lvl_list = [$ObjLevelUp, $ObjLevelUp2, $ObjLevelUp3, $ObjLevelUp4]

var currObj 
var currLvl
var score = 0
var counter = 0
var rng = RandomNumberGenerator.new()
#var background
#var modulation
#var lighty
#var lighty1

func _ready():
	$Objective.hide()
	$ObjLevelUp.hide()
	$Objective2.hide()
	$ObjLevelUp2.hide()
	$Objective3.hide()
	$ObjLevelUp3.hide()
	$Objective4.hide()
	$ObjLevelUp4.hide()

	currObj = rng.randi_range(0, obj_list.size()-1)
	currLvl = rng.randi_range(0, lvl_list.size()-1)
	obj_list[currObj].show()

func _process(delta):
	label.text= "Score: " + str(score)

func _on_Objective_body_entered(body):
	if body.get_name() == "Player":
		lvl_list[currLvl].show()
		score += 1
		$Objective.hide()
		print(score)
#	background = get_parent().get_node("Player/Camera2D/Node2D/ColorRect")
#	modulation = get_parent().get_node("CanvasModulate")
#	lighty = get_parent().get_node("Player/Light2D")
#	lighty1 = get_parent().get_node("ObjLevelUp/Light2D")


func _on_ObjLevelUp_body_entered(body):
	if body.get_name() == "Player":
		obj_list[currObj].show()
		score += 1
		$ObjLevelUp.hide()
		print(score)

func _on_Objective2_body_entered(body):
	if body.get_name() == "Player":
		lvl_list[currLvl].show()
		score += 1
		$Objective2.hide()
		print(score)


func _on_ObjLevelUp2_body_entered(body):
	if body.get_name() == "Player":
		obj_list[currObj].show()
		score += 1
		$ObjLevelUp2.hide()
		print(score)


func _on_Objective3_body_entered(body):
	if body.get_name() == "Player":
		lvl_list[currLvl].show()
		score += 1
		$Objective3.hide()
		print(score)

func _on_Objective4_body_entered(body):
	if body.get_name() == "Player":
		lvl_list[currLvl].show()
		score += 1
		$Objective4.hide()
		print(score)
		



func _on_ObjLevelUp3_body_entered(body):
	if body.get_name() == "Player":
		obj_list[currObj].show()
		score += 1
		$ObjLevelUp3.hide()
		print(score)


func _on_ObjLevelUp4_body_entered(body):
	if body.get_name() == "Player":
		obj_list[currObj].show()
		score += 1
		$ObjLevelUp4.hide()
		print(score)
