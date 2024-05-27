extends Node2D

@onready var anim = $master_cursed_key/AnimationPlayer

@export var anim_player: AnimationPlayer

func _on_cursed_lock_unlock():
	$master_cursed_key/CPUParticles2D.emitting = false
	await get_tree().create_timer(0.5).timeout
	anim.play("fade")
	await get_tree().create_timer(0.5).timeout
	$cursed_lock/CPUParticles2D.emitting = false
	$CPUParticles2D.emitting = true
	$cursed_lock/AnimationPlayer.play("smthg")
	$CPUParticles2D2.emitting = true
