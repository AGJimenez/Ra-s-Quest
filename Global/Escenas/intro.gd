extends Node2D

var enAreaNPC = false
var paused = false
var ignorarMov = false
var intro_finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Save.save_dict["map_number"] < 0):
		number_changed()
		Save.save_dict["map"] = "res://Escenas/Luis/Rooms/chest_room.tscn"
		Save.save_game()
	$Personaje.set_process(false)
	$Personaje.set_physics_process(false)
	$npc/Control.visible = false
	$AnimationPlayer.play("new_animation")
	$Personaje/Camera2D.enabled = false
	$AnimationPlayer2.play("camara")
	await $AnimationPlayer2.animation_finished
	$Personaje.set_process(true)
	$Personaje.set_physics_process(true)
	intro_finished = true
	$Camera2D.enabled = false
	$Personaje/Camera2D.enabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !ignorarMov: 
		if enAreaNPC == true and Input.is_action_just_pressed("Interact") && intro_finished && !Global.dialogue_state == true:
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/intro/controlesNpc.dialogue"),"this_is_a_node_title")
		if(intro_finished):
			if(Global.dialogue_state == true):
				$Personaje.set_physics_process(false)
			if(Global.dialogue_state == false):
				$Personaje.set_physics_process(true)
			
	if Input.is_action_just_pressed("pausa"):
		pauseMenu()
		
func _on_area_2d_body_entered(body):
	if body.name == "Personaje":
		Global.change = "intro-nivelMario"
		LoadManager.load_scene("res://Escenas/nivel1_Mario/nivel_mario.tscn")


func _on_area_2dnpc_body_entered(body):
	if body.name == "Personaje":
		enAreaNPC = true
		$npc/Control.visible = true


func _on_area_2dnpc_body_exited(body):
	enAreaNPC = false
	$npc/Control.visible = false
	
func pauseMenu():
	if paused:
		$Personaje/Camera2D/CanvasLayer.hide()
		Engine.time_scale = 1
	else:
		$Personaje/Camera2D/CanvasLayer.show()
		Engine.time_scale = 0
	paused = !paused
	ignorarMov = !ignorarMov
	
func resumeGame():
	$Personaje/Camera2D/CanvasLayer.hide()
	Engine.time_scale = 1
	ignorarMov = false
	
func reloadLevel():
	get_tree().reload_current_scene()
	$Personaje/Camera2D/CanvasLayer.hide()
	ignorarMov = false
	
func quitGame():
	LoadManager.load_scene("res://Interfaz/menu_ppal.tscn")


func _on_button_pressed():
	resumeGame()


func _on_button_3_pressed():
	quitGame()


func _on_button_2_pressed():
	reloadLevel()

func number_changed():
	Save.save_dict["map_number"] = 0
