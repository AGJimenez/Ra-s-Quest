extends Panel

@onready var nivel_Mario = get_tree().get_root().get_node("nivelMario")

var delete_all_line_flag = true
var arrayPieces:Array = []
var arraySolution: Array = [&"TextureButton", &"TextureButton15", &"TextureButton13", &"TextureButton9", &"TextureButton10", &"TextureButton12", &"TextureButton16", &"TextureButton18", &"TextureButton17", &"TextureButton21", &"TextureButton25", &"TextureButton29", &"TextureButton30", &"TextureButton26", &"TextureButton24", &"TextureButton28", &"TextureButton32", &"TextureButton34", &"TextureButton33", &"TextureButton35", &"TextureButton3", &"TextureButton6", &"TextureButton7", &"TextureButton2", &"TextureButton5", &"TextureButton4"]


func _process(delta):
	lineFunction()
	if (arrayPieces == arraySolution):
		nivel_Mario.signal_puzle3.emit()


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
				if $Line2D.get_point_count() == 0:
					$Line2D.add_point(buttonCenter(),-1)
				$Line2D.add_point(buttonCenter(),-1)
				$Line2D.set_point_position($Line2D.get_point_count()-2, buttonCenter())
				get_button_over_itself().is_selected = true
				arrayPieces.append(get_button_over_itself().name)
		if $Line2D.get_point_count() > 2:
			if (buttonCenter() == $Line2D.get_point_position($Line2D.get_point_count()-2)): 
				if get_button_over_itself().is_backtracking and get_button_over_itself().is_selected:
					get_button_over_itself().is_selected = false
		if $Line2D.get_point_count() > 0:
			$Line2D.set_point_position($Line2D.get_point_count()-1, get_global_mouse_position())
	else:
		if delete_all_line_flag:
			$Line2D.clear_points()
			arrayPieces = []
