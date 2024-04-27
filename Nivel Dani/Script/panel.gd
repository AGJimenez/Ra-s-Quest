extends Panel

var numeroDePanelesSuperados=0
signal panel_interaction_success
var ultima_Area=null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	showTileMap()
	

func showTileMap():
	match numeroDePanelesSuperados:
		0:
			$"Panel/Ecuacion 1".show()
		1:
			$"Panel/Ecuacion 2".show()

func comprobarDatos():
	var texto=$Panel/Label/TextEdit.get_text()
	match numeroDePanelesSuperados:
		0:
			if texto=="1":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 1".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/panel_respuesta_incorrecta.dialogue"),"main")
		1:
			if texto=="7":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 2".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/panel_respuesta_incorrecta.dialogue"),"main")
		_:
			hide()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Go_To_FinalPuzzle.dialogue"),"main")
	$Panel/Label/TextEdit.set_text("")
	


func _on_button_pressed():
	print(numeroDePanelesSuperados)
	comprobarDatos()
