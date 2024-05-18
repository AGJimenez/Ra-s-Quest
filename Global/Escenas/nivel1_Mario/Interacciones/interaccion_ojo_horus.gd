extends StaticBody2D
class_name InteraccionPapiroOjoHorus

@onready var label = $PanelInteraccionOjo
@onready var areaEntered: bool = false

@onready var nivel_Mario = get_tree().get_root().get_node("nivelMario")


func _on_area_2d_body_entered(body):
	if body is Personaje:
		if (nivel_Mario.puzles_resueltos == 1 and nivel_Mario.puzle_correcto == 2):
			label.show()
			areaEntered = true
		else:
			pass


func _on_area_2d_body_exited(body):
	if body is Personaje:
		label.hide()
		areaEntered = false
