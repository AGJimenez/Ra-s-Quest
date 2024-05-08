extends Node2D
class_name nivelMario

# VARIABLES GENERALES
@onready var player = get_node("Escenario/TileMap/Personaje")
@onready var panel = get_node("Escenario/TileMap/Personaje/Camera2D/Panel_Mario")
var puzles_resueltos = 0
var puzle_correcto = 0

# VARIABLES PUZLE 1
@onready var interaccionPapiro1 = get_node("Interacciones/InteraccionPapiro1")
@onready var puzle1 = get_node("Escenario/TileMap/Personaje/Camera2D/Panel_Mario/Puzle1")
@onready var resultadoPuzle1 = get_node("Escenario/TileMap/Personaje/Camera2D/Panel_Mario/Puzle1/TextoPuzle1")
@onready var botonPuzle1 = get_node("Escenario/TileMap/Personaje/Camera2D/Panel_Mario/Puzle1/BotonPuzle1")

# SEÑALES 
signal signal_button_pressed

# MÉTODOS
func _ready():
	$AnimationPlayer.play("new_animation")


func _process(_delta):
	interacciones()


func interacciones():
# MANEJO PUZZLE 1
	if (interaccionPapiro1.areaEntered == true && player.has_interacted == true):
		$ColorRect.hide()
		player.speed = 0
		panel.show()
		if (puzle_correcto == 1):
			panel.hide()
			interaccionPapiro1.hide()
			puzles_resueltos = puzles_resueltos + 1
			player.speed = 100
	


func _on_signal_button_puzle1_pressed():
	if (resultadoPuzle1.get_text() == "2"):
		puzle_correcto = 1
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivel1_Mario/dialogo_acierto_puzle1.dialogue"), "dialogo_acierto_puzle1");
	elif (resultadoPuzle1.get_text() != "2"):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivel1_Mario/dialogo_error_puzle1.dialogue"), "dialogo_error_puzle1");
