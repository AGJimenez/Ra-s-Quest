extends Node2D

var conversacionNave = false
var primeraVez = false

func _ready():
	$Camera2D.enabled = true
	$Personaje.set_process(false)
	$Personaje.set_physics_process(false)
	$Personaje/Camera2D.enabled = false
	$AnimationPlayer.play("new_animation")
	$paredFrontal.visible = true
	$ship/Camera2D.enabled = false
	$ship.set_physics_process(false)
	$ship.set_process(false)
	$ship.visible = false
	await $AnimationPlayer.animation_finished
	$Camera2D.enabled = false
	$Personaje.set_process(true)
	$Personaje.set_physics_process(true)
	$Personaje/Camera2D.enabled = true
	$paredFrontal.visible = false
	
func _process(delta):
	if conversacionNave == true && !Global.dialogue_state == true && primeraVez == false:
		primeraVez = true
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/finalBoss/nave.dialogue"), "start")
		#HACER INVISIBLE AL PIBE

func _on_conversacion_body_entered(body):
	if conversacionNave == false:
		if body.name == "Personaje":
			$raAparecer.play("raAparecer")
			conversacionNave = true
