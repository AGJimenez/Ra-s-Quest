extends Node2D

var sender

var bounces := 1

const maxLength := 2000

@onready var line = $Line2D
var max_cast_to
var rot := 0.0

var lasers := []

func _ready():
	lasers.append($Laser)
	
	for i in range (bounces):
		
		var raycast = $Laser.duplicate()
		raycast.enabled = false
		raycast.add_exception(sender)
		add_child(raycast)
		lasers.append(raycast)
		
	max_cast_to = Vector2(maxLength, 0).rotated(rot)
	$Laser.cast_to = max_cast_to
	
	$Line2D.set_as_toplevel(true)

func _process(delta):
	
	rot = get_local_mouse_position().angle()
	
	line.clear_points()
	
	line.add_point(global_position)
	
	max_cast_to = Vector2(maxLength, 0).rotated(rot)
