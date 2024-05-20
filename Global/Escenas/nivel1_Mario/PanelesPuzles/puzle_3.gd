extends Panel


var presionado: bool = false
var draw_line


func _input(event):
	if (event is InputEventMouseButton):
		if (event.pressed):
			presionado = true
			draw_line = Line2D.new()
			draw_line.default_color = Color('#ffffff')
			draw_line.width = 6
		else:
			presionado = false
	if (event is InputEventMouseMotion):
		if (presionado == true):
			draw_line.add_to_group("Draw")
			draw_line.add_point(event.position)
			add_child(draw_line)
		else:
			if (get_tree().get_nodes_in_group("Draw")):
				for line in get_tree().get_nodes_in_group("Draw"):
					line.queue_free()
