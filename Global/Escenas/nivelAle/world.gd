extends Node2D

class_name world

var enAreaPlayer = false
var paused = false
var ignorarMov = false

func _ready():
	$Area2D/Control.visible = false
	if Global.change == "night-world":
		$player.global_position = $"spawn_points/night-world".global_position
	#connect()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !ignorarMov: 
		if enAreaPlayer == true and Input.is_action_just_pressed("Interact"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelAle/Mito.dialogue"), "start")
		if(Global.dialogue_state == true):
			$player.set_physics_process(false)
		if(Global.dialogue_state == false):
			$player.set_physics_process(true)

	if Input.is_action_just_pressed("pausa"):
		pauseMenu()
		

func pauseMenu():
	if paused:
		$player/Camera2D/CanvasLayer.hide()
		Engine.time_scale = 1
	else:
		$player/Camera2D/CanvasLayer.show()
		Engine.time_scale = 0
	paused = !paused
	ignorarMov = !ignorarMov
	
func resumeGame():
	$player/Camera2D/CanvasLayer.hide()
	Engine.time_scale = 1
	ignorarMov = false
	
func reloadLevel():
	get_tree().reload_current_scene()
	resumeGame()

func quitGame():
	get_tree().quit()

func _on_area_2d_body_entered(body):
	if body.name == "player":
		enAreaPlayer = true
		$Area2D/Control.visible = true
		print("jeroglifico")

	
func _on_area_2d_body_exited(_body):
	enAreaPlayer = false
	$Area2D/Control.visible = false


func _on_button_pressed():
	resumeGame()

func _on_button_2_pressed():
	reloadLevel()


func _on_button_3_pressed():
	quitGame()
