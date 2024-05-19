extends Node2D

class_name world

var enAreaAltar = false
var enAreaPlayer = false
var enAreaPlayerCofre = false
var paused = false
var ignorarMov = false
var transComplete = false
var segundoPuzzleActivado = false
var espejosAcabados = false
var animacionAltar = false
func _ready():
	if(Save.save_dict["map_number"] < 5):
		number_changed()
		Save.save_dict["map"] = "res://Escenas/nivelAle/world.tscn"
		Save.save_game()
	transComplete = false
	$pasilloHabitacion.visible = false
	ignorarMov = true

	$player.set_process(false)

	$altar/CollisionShape2D3.disabled = true

	$player.set_physics_process(false)
	$player/Camera2D/puzzleDioses.visible = false
	$player/Camera2D.enabled = false
	$Area2D/Control.visible = false
	$Area2D2/Control.visible = false
	$altar/Control.visible = false
	$AnimationPlayer.play("camera")
	await $AnimationPlayer.animation_finished
	transComplete = true
	ignorarMov = false
	$player.set_process(true)
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
			$Rayo1.play("aparecer")
			$columna6.rotarCol1(_delta)
			if $columna6.isRotating == false:
				$Rayo2.play("rayo2")
				$columna5.rotarCol2(_delta)
				if $columna5.isRotating == false:
					$Rayo3.play("rayo3")
					$columna1.rotarCol3(_delta)
					if $columna1.isRotating == false:
						$Rayo4.play("rayo4")
						$columna2.rotarCol4(_delta)
						if $columna2.isRotating == false:
							$Rayo5.play("rayo5")
							$columna3.rotarCol5(_delta)
							if $columna3.isRotating == false:
								$Rayo6.play("rayo6")
								$columna4.rotarCol6(_delta)
								if $columna4.isRotating == false:
									$Rayo7.play("rayo7")
									espejosAcabados = true
			if espejosAcabados and !animacionAltar:
				print("emergiendo")
				$altarAnimacion.play("emerger")
				$altar/CollisionShape2D3.disabled = false
				animacionAltar = true
				if enAreaAltar == true and Input.is_action_just_pressed("Interact") && $player/Camera2D/puzzleDioses.visible == false:
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



func _on_puzzle_dioses_resultado_correcto():
	$colision/puertaColision.disabled = true
	$TileMap2.set_layer_enabled(0,false)
	parteDos()
	
func parteDos():
	
	$pasilloHabitacion.visible = true


func _on_area_espejo_body_entered(body):
	if body.name == "RigidBody2D":
		print("OBJETO")
		$RigidBody2D.freeze = true
		segundoPuzzleActivado = true


func _on_area_altar_body_entered(body):
	if body.name == "player":
		$altar/Control.visible = true
		enAreaAltar = true

func _on_area_altar_body_exited(body):
	$altar/Control.visible = false

func number_changed():
	Save.save_dict["map_number"] = 5
	enAreaAltar = false
