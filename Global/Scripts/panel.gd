extends Panel

var numeroDePanelesSuperados=8
signal panel_interaction_success
var ultima_Area=null


func _ready():
	print("HOLAAAAAAAAAAAAAAAAA")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	showTileMap()
	

func showTileMap():
	match numeroDePanelesSuperados:
		0:
			$"Panel/Ecuacion 1".show()
		1:
			$"Panel/Ecuacion 2".show()
		2:
			$"Panel/Ecuacion 3".show()
		3:
			$"Panel/Ecuacion 4".show()
		4: 
			$"Panel/Ecuacion 5".show()
		5:
			$"Panel/Ecuacion 6".show()
		6:
			$"Panel/Ecuacion 7".show()
		7:
			$"Panel/Ecuacion 8".show()
		8:
			$Panel/Label.hide()
			$Panel/Label2.show()
			$"Panel/Ecuacion 9".show()
		9:
			$"Panel/Ecuacion 10".show()

func comprobarDatos():
	var texto=$Panel/Label/TextEdit.get_text()
	var textoLabel2=$Panel/Label2/TextEdit.get_text()
	var texto2Label2=$Panel/Label2/TextEdit2.get_text()
	match numeroDePanelesSuperados:
		0:
			if texto=="2":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 1".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		1:
			if texto=="7":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 2".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		2:
			if texto=="-1":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 3".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		3:
			if texto=="1":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 4".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		4:
			if texto=="7":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 5".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		5:
			if texto=="2":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 6".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		6:
			if texto=="3":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 7".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		7:
			if texto=="2":
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 8".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		8:
			if (textoLabel2=="14" && texto2Label2=="-14") || (textoLabel2=="-14" && texto2Label2=="14"):
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 9".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		9:
			if (textoLabel2=="0" && texto2Label2=="-2") || (textoLabel2=="-2" && texto2Label2=="0"):
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_correcta.dialogue"),"main")
				$"Panel/Ecuacion 10".hide()
				hide()
				numeroDePanelesSuperados=numeroDePanelesSuperados+1
				ultima_Area.queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta_incorrecta.dialogue"),"main")
		_:
			hide()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/Go_To_FinalPuzzle.dialogue"),"main")
	$Panel/Label/TextEdit.set_text("")
	$Panel/Label2/TextEdit.set_text("")
	$Panel/Label2/TextEdit2.set_text("")
	


func _on_button_pressed():
	print(numeroDePanelesSuperados)
	comprobarDatos()


func _on_button_pressed_2():
	print(numeroDePanelesSuperados)
	comprobarDatos()
