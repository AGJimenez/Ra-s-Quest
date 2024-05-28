extends Node2D

var conversacionNave = false
var primeraVez = false
var naveAparece = false

@export_group("Player")
@export var player: CharacterBody2D

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
	if(Global.controls_right_click):
		$Personaje/Camera2D/right_click.visible = true
	else:
		$Personaje/Camera2D/right_click.visible = false

	if(Global.dialogue_state):
		player.velocity = Vector2.ZERO
		player.direction = Vector2.ZERO
		player.set_physics_process(false)

	if(Global.ra_fade):
		$raAparecer.play("raDesaparecer")
		await $raAparecer.animation_finished
		player.set_physics_process(true)
		Global.ra_fade = false
	
	if conversacionNave == true && primeraVez == false:
		primeraVez = true
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/finalBoss/nave.dialogue"), "start")


func _on_conversacion_body_entered(body):
	if conversacionNave == false:
		if body.name == "Personaje":
			$raAparecer.play("raAparecer")
			conversacionNave = true


func _on_ship_area_body_entered(body):
	if(body.is_in_group("Player")):
		player.velocity = Vector2.ZERO
		player.direction = Vector2.ZERO
		player.set_physics_process(false)
		$desaparecer.play("desaparecerEstatua")
		await $desaparecer.animation_finished
		$Personaje/Camera2D.enabled = false
		$Personaje.visible = false
		$ship/Camera2D.enabled = true
		$ship.set_physics_process(true)
		$ship.set_process(true)
		$StaticBody2D/Sprite2D.visible = false
		$ship.visible = true
		
