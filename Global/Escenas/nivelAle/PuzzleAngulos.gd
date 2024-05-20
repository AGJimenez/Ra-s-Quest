extends Control
signal correct_position_set
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
			print("Posicion correcta")
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


func _on_angulo_5_body_entered(body):
	if body.name == "angulo9":
		pieza3 = true
		print("Holi a9")


func _on_angulo_4_body_entered(body):
	if body.name == "angulo10":
		pieza4 = true
		print("Holi a10")


func _on_angulo_2_body_entered(body):
	if body.name == "angulo11":
		pieza5 = true
		print("Holi a11")


func _on_angulo_1_body_entered(body):
	if body.name == "angulo12":
		pieza6 = true
		print("Holi a12")
