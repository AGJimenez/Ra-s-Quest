extends Node2D
class_name nivelMario

# VARIABLES GENERALES
@onready var player = get_node("Escenario/TileMap/Personaje")
@onready var panel = get_node("Escenario/CanvasLayer")

var puzles_resueltos = 2
var puzle_correcto = 2

# VARIABLES PUZLE 1
@onready var interaccionPapiro1 = get_node("Interacciones/InteraccionPapiro1")
@onready var puzle1 = get_node("Escenario/CanvasLayer/Panel_Mario/Puzle1")
@onready var resultadoPuzle1 = get_node("Escenario/CanvasLayer/Panel_Mario/Puzle1/TextoPuzle1")
@onready var botonPuzle1 = get_node("Escenario/CanvasLayer/Panel_Mario/Puzle1/BotonPuzle1")

# VARIABLES PUZLE 2
@onready var interaccionPapiro2 = get_node("Interacciones/InteraccionPapiro2")
@onready var puzle2 = get_node("Escenario/CanvasLayer/Panel_Mario/Puzle2")

# VARIABLES PROBLEMA OJO HORUS
@onready var interaccionOjoHorus = get_node("Interacciones/InteraccionOjoHorus")
@onready var panelOjoHorus = get_node("Escenario/CanvasLayer/Panel_Mario/ProblemaOjoHorus")
@onready var resultadoOjoHorus = get_node("Escenario/CanvasLayer/Panel_Mario/ProblemaOjoHorus/TextoOjoHorus")
@onready var botonOjoHorus = get_node("Escenario/CanvasLayer/Panel_Mario/ProblemaOjoHorus/BotonOjoHorus")


# SEÑALES 
signal signal_button_pressed
signal signal_puzle2
signal signal_problema_ojohorus

# MÉTODOS
func _ready():
	if(Save.save_dict["map_number"] < 1):
		number_changed()
		Save.save_dict["map"] = "res://Escenas/nivel1_Mario/nivel_mario.tscn"
		Save.save_game()


func _process(_delta):
	interacciones()
	if (Global.dialogue_state == true):
		player.speed = 0
	else:
		player.speed = 100


func interacciones():
# MANEJO PUZZLE 1
	if (interaccionPapiro1.areaEntered == true and player.has_interacted == true):
		player.speed = 0
		panel.show()
		if (puzle_correcto == 1):
			panel.hide()
			puzle1.hide()
			interaccionPapiro1.hide()
			interaccionPapiro2.show()
			puzles_resueltos += 1
			player.speed = 100
			player.has_interacted = false
# MANEJO PUZLE 2
	if (interaccionPapiro2.areaEntered == true and player.has_interacted == true):
		player.speed = 0
		panel.show()
		puzle2.show()
		if (puzle_correcto == 2):
			panel.hide()
			puzle2.hide()
			interaccionPapiro2.hide()
			player.speed = 100
			player.has_interacted = false
# MANEJO PROBLEMA OJO HORUS
	if(interaccionOjoHorus.areaEntered == true and player.has_interacted == true):
		player.speed = 0
		panel.show()
		panelOjoHorus.show()
		#DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelMario/dialogo_ojohorus.dialogue"), "dialogo_ojohorus");



# METODOS DE SEÑALES
func _on_signal_button_puzle1_pressed():
	if (resultadoPuzle1.get_text() == "2"):
		puzle_correcto += 1
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelMario/dialogo_acierto_puzle1.dialogue"), "dialogo_acierto_puzle1");
	elif (resultadoPuzle1.get_text() != "2"):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelMario/dialogo_error_puzle1.dialogue"), "dialogo_error_puzle1");


func _on_signal_puzle_2():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelMario/dialogo_acierto_puzle2.dialogue"), "dialogo_acierto_puzle2");
	puzle_correcto += 1
	#if (Global.dialogue_state == false):
		#puzle_correcto += 1

func number_changed():
	Save.save_dict["map_number"] = 1


func _on_signal_problema_ojohorus():
	if(resultadoOjoHorus.get_text() == "26'875" or resultadoOjoHorus.get_text() == "26,875"):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelMario/dialogo_acierto_ojohorus.dialogue"), "dialogo_acierto_ojohorus");
		puzles_resueltos += 1
		panel.hide()
		panelOjoHorus.hide()
		interaccionOjoHorus.hide()
		player.speed = 100
		player.has_interacted = false
	else:
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelMario/dialogo_error_puzle1.dialogue"), "dialogo_error_puzle1");
		
