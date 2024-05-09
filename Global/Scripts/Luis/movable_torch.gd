extends RigidBody2D


func _process(delta):
	if(Global.activated):
		$Fire.visible = false
		$Light.visible = false
		$Base.material.set_light_mode(0)

