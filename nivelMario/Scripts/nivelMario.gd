extends Node2D

@onready var papiroUno = get_node("Interacciones/Papiro1")
@onready var player = get_node("Escenario/TileMap/Personaje/CharacterBody2D")
@onready var panel = get_node("Escenario/TileMap/Personaje/CharacterBody2D/Camera2D/Panel")

func _ready():
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/dialogo_inicial.dialogue"))
	return
	
func _process(_delta):
	interacciones()


func interacciones():
# MANEJO PUZZLE 1
	if (papiroUno.areaEntered == true && player.has_interacted == true):
		player.speed = 0
		panel.show()
