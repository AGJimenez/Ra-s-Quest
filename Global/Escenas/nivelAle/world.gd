extends Node2D

class_name world

var enAreaPlayer = false
var enAreaPlayerCofre = false
var paused = false
var ignorarMov = false
var transComplete = false
var segundoPuzzleActivado = false
var palancaArea1 = false
var palancaArea2 = false
var palancaArea3 = false
var palancaArea4 = false
var palancaArea5 = false
var palancaArea6 = false


func _ready():
	transComplete = false
	$pasilloHabitacion.visible = false
	ignorarMov = true
	$player.set_physics_process(false)
	$player/Camera2D/puzzleDioses.visible = false
	$player/Camera2D.enabled = false
	$Area2D/Control.visible = false
	$Area2D2/Control.visible = false
	
	$areaPalanca1/Control.visible = false
	$areaPalanca2/Control.visible = false
	$areaPalanca3/Control.visible = false
	$areaPalanca4/Control.visible = false
	$areaPalanca5/Control.visible = false
	$areaPalanca6/Control.visible = false
	
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

		if enAreaPlayerCofre == true and Input.is_action_just_pressed("Interact") && $player/Camera2D/puzzleDioses.visible == false:
			$player/Camera2D/puzzleDioses.visible = true

			
		elif enAreaPlayerCofre == true and Input.is_action_just_pressed("Interact") && $player/Camera2D/puzzleDioses.visible == true:
			$player/Camera2D/puzzleDioses.visible = false
		
		if segundoPuzzleActivado == true:
			
			if palancaArea1 == true and Input.is_action_pressed("Interact"):
				print("AREA1")
				$columna1.rotateMirror(_delta)
				
			if palancaArea2 == true and Input.is_action_pressed("Interact"):
				print("AREA1")
				$columna3.rotateMirror(_delta)
			if palancaArea3 == true and Input.is_action_pressed("Interact"):
				print("AREA1")
				$columna5.rotateMirror(_delta)
			if palancaArea4 == true and Input.is_action_pressed("Interact"):
				print("AREA1")
				$columna6.rotateMirror(_delta)
			if palancaArea5 == true and Input.is_action_pressed("Interact"):
				print("AREA1")
				$columna2.rotateMirror(_delta)
			if palancaArea6 == true and Input.is_action_pressed("Interact"):
				$columna4.rotateMirror(_delta)
				print("AREA1")
						
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



func _on_puzzle_dioses_resultado_correcto():
	$colision/puertaColision.disabled = true
	$TileMap2.set_layer_enabled(0,false)
	parteDos()
	
func parteDos():
	segundoPuzzleActivado = true
	$pasilloHabitacion.visible = true


func _on_area_espejo_body_entered(body):
	if body.name == "RigidBody2D":
		print("OBJETO")
		$RigidBody2D.freeze = true
		segundoPuzzleActivado = true

func _on_area_palanca_1_body_entered(body):
	if body.name == "player":
		$areaPalanca1/Control.visible = true
		palancaArea1 = true


func _on_area_palanca_1_body_exited(body):
	$areaPalanca1/Control.visible = false
	palancaArea1 = false

func _on_area_palanca_2_body_entered(body):
	if body.name == "player":
		$areaPalanca2/Control.visible = true
		palancaArea2 = true

func _on_area_palanca_2_body_exited(body):
	$areaPalanca2/Control.visible = false
	palancaArea2 = false

func _on_area_palanca_3_body_entered(body):
	if body.name == "player":
		$areaPalanca3/Control.visible = true
		palancaArea3 = true

func _on_area_palanca_3_body_exited(body):
	$areaPalanca3/Control.visible = false
	palancaArea3 = false

func _on_area_palanca_4_body_entered(body):
	if body.name == "player":
		$areaPalanca4/Control.visible = true
		palancaArea4 = true

func _on_area_palanca_4_body_exited(body):
	$areaPalanca4/Control.visible = false
	palancaArea4 = false

func _on_area_palanca_5_body_entered(body):
	if body.name == "player":
		$areaPalanca5/Control.visible = true
		palancaArea5 = true

func _on_area_palanca_5_body_exited(body):
	$areaPalanca5/Control.visible = false
	palancaArea5 = false

func _on_area_palanca_6_body_entered(body):
	if body.name == "player":
		$areaPalanca6/Control.visible = true
		palancaArea6 = true

func _on_area_palanca_6_body_exited(body):
	$areaPalanca6/Control.visible = false
	palancaArea6 = false
