extends Node2D
class_name nivelMario

@onready var papiro1 = get_node("Interacciones/Papiro1")
@onready var player = get_node("Escenario/TileMap/Personaje/CharacterBody2D")
@onready var panel = get_node("Escenario/TileMap/Personaje/CharacterBody2D/Camera2D/Panel_Mario")
@onready var puzle1 = get_node("Escenario/TileMap/Personaje/CharacterBody2D/Camera2D/Panel_Mario/Puzle1")
@onready var resultadoPuzle1 = get_node("Escenario/TileMap/Personaje/CharacterBody2D/Camera2D/Panel_Mario/Puzle1/TextEdit")
@onready var botonPuzle1 = get_node("Escenario/TileMap/Personaje/CharacterBody2D/Camera2D/Panel_Mario/Puzle1/Button")

signal signal_button_pressed
var botonpulsado1 = false

func _ready():
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivel1_Mario/dialogo_inicial.dialogue"), "dialogo_inicial")
	return
	
func _process(_delta):
	interacciones()


func interacciones():
# MANEJO PUZZLE 1
	if (papiro1.areaEntered == true && player.has_interacted == true):
		player.speed = 0
		panel.show()
		if (resultadoPuzle1.get_text() == "2" && botonpulsado1 == true):
			panel.hide()
		elif  (resultadoPuzle1.get_text() != "2" && botonpulsado1 == true):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivel1_Mario/dialogo_error_puzle1.dialogue"), 			"dialogo_error_puzle1");
		else:
			pass



func _on_signal_button_puzle1_pressed():
	botonpulsado1 = true
	print("boton funcionaa")
