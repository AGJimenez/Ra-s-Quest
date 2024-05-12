extends Control

signal correct_position_set
signal resultadoCorrecto

var raEnter = false
var osirisEnter = false
var horusEnter = false
var posicionCorrecta = false

func _process(delta):
	correctPlacement()

func _on_ra_area_body_entered(body):
	if body.name == "Ra":
		raEnter = true
		print("Holi Ra")


func _on_ra_area_body_exited(body):
	raEnter = false


func _on_osiris_area_body_entered(body):
	if body.name == "Osiris":
		osirisEnter = true
		print("Holi Osiris")


func _on_osiris_area_body_exited(body):
	osirisEnter = false


func _on_horus_area_body_entered(body):
	if body.name == "Horus":
		horusEnter = true
		print("Holi Horus")


func _on_horus_area_body_exited(body):
	horusEnter = false
	
func correctPlacement():
	if posicionCorrecta == false:
		if horusEnter == true && osirisEnter == true && raEnter == true:
			print("Posicion correcta, introduce valor")
			posicionCorrecta = true
			emit_signal("correct_position_set")


func _on_button_pressed():
	if posicionCorrecta && $TextEdit.get_text() == "2":
		print("RESPUESTA CORRECTA")
		emit_signal("resultadoCorrecto")
