extends Node2D

var enAreaNPC = false
var paused = false
var ignorarMov = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$npc/Control.visible = false
	$AnimationPlayer.play("new_animation")
	$Personaje/Camera2D.enabled = false
	$AnimationPlayer2.play("camara")
	await get_tree().create_timer(5).timeout
	$Camera2D.enabled = false
	$Personaje/Camera2D.enabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !ignorarMov: 
		if enAreaNPC == true and Input.is_action_just_pressed("Interact"):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/intro/controlesNpc.dialogue"),"this_is_a_node_title")
		
		
	if Input.is_action_just_pressed("pausa"):
		pauseMenu()
		
func _on_area_2d_body_entered(body):
	if body.name == "Personaje":
		get_tree().change_scene_to_file("res://Escenas/nivel1_Mario/nivel_mario.tscn")


func _on_area_2dnpc_body_entered(body):
	if body.name == "Personaje":
		enAreaNPC = true
		$npc/Control.visible = true
		print("Conversacion con npc")


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
	get_tree().quit()


func _on_button_pressed():
	resumeGame()


func _on_button_3_pressed():
	quitGame()


func _on_button_2_pressed():
	reloadLevel()
