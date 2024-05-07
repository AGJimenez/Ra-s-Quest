extends StaticBody2D
class_name Papiro1

@onready var label = $Label
@onready var areaEntered: bool = false

@onready var nivelMario = get_tree().get_root().get_node("nivelMario")


func _on_area_2d_body_entered(body):
	if body is Personaje:
		if (nivelMario.puzles_correctos == 0):
			label.show()
			areaEntered = true
			print(areaEntered)
		else:
			pass


func _on_area_2d_body_exited(body):
	if body is Personaje:
		label.hide()
		areaEntered = false
		print(areaEntered)
