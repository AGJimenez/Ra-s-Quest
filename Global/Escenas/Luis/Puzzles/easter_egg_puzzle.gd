extends Control



@onready var anim = $master_cursed_key/AnimationPlayer

@export var anim_player: AnimationPlayer

func _on_cursed_lock_unlock():
	$master_cursed_key/CPUParticles2D.emitting = false
	await get_tree().create_timer(0.5).timeout
	anim.play("fade")
	await get_tree().create_timer(0.5).timeout
	$cursed_lock/CPUParticles2D.emitting = false
	$cursed_lock/AnimationPlayer.play("smthg")
	await get_tree().create_timer(0.25).timeout
	Global.doom_bool = true
	Global.change = "easter_egg-chest"
	LoadManager.load_scene("res://Escenas/Luis/Rooms/chest_room.tscn")
