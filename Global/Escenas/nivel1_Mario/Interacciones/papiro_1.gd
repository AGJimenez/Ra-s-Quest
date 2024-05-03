extends StaticBody2D
class_name Papiro1

@onready var label = $Label
@onready var panel = get_node("../../Escenario/TileMap/Personaje/CharacterBody2D/Camera2D/Panel")
@onready var areaEntered: bool = false

func _on_area_2d_body_entered(body):
	if body is Personaje:
		label.show()
		areaEntered = true
		print(areaEntered)


func _on_area_2d_body_exited(body):
	if body is Personaje:
		label.hide()
		areaEntered = false
		print(areaEntered)
