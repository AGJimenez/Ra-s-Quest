extends Panel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func comprobarDatos():
	var texto=$Panel/Label/TextEdit.get_text()
	if texto=="1":
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/panel_respuesta_correcta.dialogue"),"main")
		hide()
	else:
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/panel_respuesta_incorrecta.dialogue"),"main")


func _on_button_pressed():
	comprobarDatos()
