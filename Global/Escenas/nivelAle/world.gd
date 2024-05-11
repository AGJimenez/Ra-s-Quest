extends Node2D

class_name world

var enAreaPlayer = false
var enAreaPlayerCofre = false
var paused = false
var ignorarMov = false
var transComplete = false

func _ready():
	transComplete = false
	ignorarMov = true
	$player.set_physics_process(false)
	$player/Camera2D.enabled = false
	$Area2D/Control.visible = false
	$Area2D2/Control.visible = false
	$AnimationPlayer.play("camera")
	await get_tree().create_timer(5).timeout
	transComplete = true
	ignorarMov = false
	$player.set_physics_process(true)
	$Camera2D.enabled = false
	$player/Camera2D.enabled = true
	if Global.change == "night-world":
		$player.global_position = $"spawn_points/night-world".global_position
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !ignorarMov and transComplete: 
		if enAreaPlayer == true and Input.is_action_just_pressed("Interact")  && !Global.dialogue_state == true:
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelAle/Mito.dialogue"), "start")
		if enAreaPlayerCofre == true and Input.is_action_just_pressed("Interact"):
			pass
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


func _on_area_2d_2_body_entered(body):
	if body.name == "player":
		enAreaPlayerCofre = true
		$Area2D2/Control.visible = true


func _on_area_2d_2_body_exited(body):
	enAreaPlayerCofre = false
	$Area2D2/Control.visible = false
