extends Node2D

var draggin = false
var of  = Vector2(0,0)
var draggable = true

func _process(_delta):
	if draggin && draggable:
		position = get_global_mouse_position() - of





func _on_button_button_down():
	draggin = true
	of = get_global_mouse_position() - global_position


func _on_button_button_up():
	draggin = false


func _on_lock_unlock():
	draggable = false
