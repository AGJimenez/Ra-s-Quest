extends Node2D

signal unlock

var done = false

@onready var anim = $anim

func _on_area_2d_body_entered(body):
	if(body.is_in_group("Key")):
		anim.play("unlock")
		if(!done):
			emit_signal("unlock")
		done = true
