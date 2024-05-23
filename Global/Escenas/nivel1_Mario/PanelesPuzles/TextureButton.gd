extends TextureButton


var has_exec = false
var mouseover = false
var is_selected = false
var is_backtracking = false



func _process(delta):
	if get_parent().Touching:
		checkHover()


func checkHover():
	var mousepos = get_viewport().get_mouse_position()
	if get_global_rect().has_point(mousepos):
		if !has_exec:
			has_exec = true
			mouseover = true
			if is_selected:
				is_backtracking = true
			else:
				get_parent().readyToAddLine = true
				self.modulate = Color(1,0,0)
	else:
		has_exec = false
		mouseover = false
		is_backtracking = false




func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			pass
		else:
			has_exec = false
			for v in get_parent().get_children():
				v.mouseover = false
				self.modulate = Color(1,1,1)


func _on_button_down():
	get_parent().Touching = true
	get_parent().readyToAddLine = true


func _on_button_up():
	get_parent().Touching = false
	mouseover = false
	for v in get_parent().get_children():
		v.is_selected = false
