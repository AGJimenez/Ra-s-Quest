extends Node2D

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
	pass
