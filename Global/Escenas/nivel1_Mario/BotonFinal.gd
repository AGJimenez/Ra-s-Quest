extends TileMap
class_name BotonFinal

@onready var label = $Area2D/PanelInteraccionFinal
@onready var areaEntered: bool = false

@onready var nivel_Mario = get_tree().get_root().get_node("nivelMario")

func _on_area_2d_body_entered(body):
	if body is Personaje:
		if (nivel_Mario.puzles_resueltos == 3):
			label.show()
			areaEntered = true
		else:
			pass


func _on_area_2d_body_exited(body):
	if body is Personaje:
		label.hide()
		areaEntered = false
