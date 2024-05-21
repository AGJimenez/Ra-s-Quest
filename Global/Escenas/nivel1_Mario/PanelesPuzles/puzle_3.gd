extends Panel


var delete_all_line_flag = true


func _process(delta):
	lineFunction()


func buttonCenter():
	for v in $CustomButtons.get_children():
		if v.mouseover:
			return v.get_global_rect().get_center()


func get_button_over_itself():
	for v in $CustomButtons.get_children():
		if v.mouseover:
			return v



func lineFunction():
	if $CustomButtons.Touching == true:
		if $CustomButtons.readyToAddLine == true:
			if buttonCenter():
#				PROBANDO CON ESTA LÍNEA
				get_button_over_itself().actual_name = get_button_over_itself().name
				if $Line2D.get_point_count() == 0:
					$Line2D.add_point(buttonCenter(),-1)
					get_button_over_itself().first_clicked = get_button_over_itself().name
				$Line2D.add_point(buttonCenter(),-1)
				$Line2D.set_point_position($Line2D.get_point_count()-2, buttonCenter())
				get_button_over_itself().is_selected = true
		if $Line2D.get_point_count() > 2:
			if (buttonCenter() == $Line2D.get_point_position($Line2D.get_point_count()-2)): 
				if get_button_over_itself().is_backtracking:
					$Line2D.remove_point($Line2D.get_point_count()-2)
					get_button_over_itself().is_selected = false
		if $Line2D.get_point_count() > 0:
			$Line2D.set_point_position($Line2D.get_point_count()-1, get_global_mouse_position())
	else:
		if delete_all_line_flag:
			$Line2D.clear_points()
