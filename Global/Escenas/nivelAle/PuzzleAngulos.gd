extends Control
signal correct_position_set
signal resultadoCorrecto
var pieza1 = false
var pieza2 = false
var pieza3 = false
var pieza4 = false
var pieza5 = false
var pieza6 = false
var posicionCorrecta = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	correctPlacement()

func correctPlacement():
	if posicionCorrecta == false:
		if pieza1 == true && pieza2 == true && pieza3 == true && pieza4 == true && pieza5 == true && pieza6 == true:
			print("Posicion correcta, introduce valor")
			posicionCorrecta = true
			emit_signal("correct_position_set")

func _on_angulo_6_body_entered(body):
	if body.name == "angulo8":
		pieza2 = true
		print("Holi a2")


func _on_angulo_3_body_entered(body):
	if body.name == "angulo7":
		pieza1 = true
		print("Holi a1")
