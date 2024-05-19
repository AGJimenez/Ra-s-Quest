extends Control

signal correct_position_set
signal resultadoCorrecto

var isLujuriaPositionCorrect = false
var isEnvidiaPositionCorrect = false
var isAvariciaPositionCorrect = false
var isPerezaPositionCorrect = false
var isSoberbiaPositionCorrect = false

var isPurezaPositionCorrect = false
var isAltruimoPositionCorrect = false
var isEsfuerzoPositionCorrect = false
var isHumildadPositionCorrect = false
var isCaridadPositionCorrect = false

var isBalanzaIzqCorrect = false
var isBalanzaDerCorrect = false

var isSolucionCorrect = false

# Use $ to get the nodes directly
@onready var Avaricia = $Avaricia
@onready var Soberbia = $Soberbia
@onready var Lujuria = $Lujuria
@onready var Humildad = $Humildad
@onready var Pureza = $Pureza
@onready var Altruismo = $Altruismo
@onready var Pereza = $Pereza
@onready var Esfuerzo = $Esfuerzo
@onready var Caridad = $Caridad
@onready var Envidia = $Envidia

func _process(delta):
	correctPlacement()

func correctPlacement():
	if not isSolucionCorrect:
			if isPerezaPositionCorrect && isAvariciaPositionCorrect && isEnvidiaPositionCorrect && isLujuriaPositionCorrect && isSoberbiaPositionCorrect:
				isBalanzaIzqCorrect = true
				var cont = 0
				if cont == 0:
					print("BALANZA IZQUIERDA COMPLETADA")
					cont = 1
			
			if isAltruimoPositionCorrect && isCaridadPositionCorrect && isHumildadPositionCorrect && isPurezaPositionCorrect && isEsfuerzoPositionCorrect:
				isBalanzaDerCorrect = true
				var cont = 0
				if cont == 0:
					print("BALANZA DERECHA COMPLETADA")
					cont = 1
			
			if isBalanzaDerCorrect && isBalanzaIzqCorrect:
				isSolucionCorrect = true
				emit_signal("resultadoCorrecto")

func _on_balanza_izquierda_body_entered(body):
	if body.name == "Envidia":
		isEnvidiaPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false
	elif body.name == "Lujuria":
		isLujuriaPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false
	elif body.name == "Avaricia":
		isAvariciaPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false
	elif body.name == "Soberbia":
		isSoberbiaPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false
	elif body.name == "Pereza":
		isPerezaPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false


func _on_balanza_derecha_body_entered(body):
	if body.name == "Humildad":
		isHumildadPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false
	elif body.name == "Esfuerzo":
		isEsfuerzoPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false
	elif body.name == "Caridad":
		isCaridadPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false
	elif body.name == "Pureza":
		isPurezaPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false
	elif body.name == "Altruismo":
		isAltruimoPositionCorrect = true
		var sprite = body.get_node("Sprite2D") if body.has_node("Sprite2D") else null
		if sprite:
			sprite.visible = false

