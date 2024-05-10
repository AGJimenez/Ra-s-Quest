extends Area2D


var piezas = []
var resuelto = []
var mouse 


# Called when the node enters the scene tree for the first time.
func _ready():
	comenzar_puzle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse):
		var mouse_copy = mouse
		print(mouse.position)
		mouse = false
		var rows = int(mouse_copy.position.y / 80)
		var cols = int(mouse_copy.position.x / 80) -2
		print(rows, cols)
		
#MINUTO DE VIDEO= 10:14


func comenzar_puzle():
	piezas = [$Pieza1, $Pieza2, $Pieza3, $Pieza4, $Pieza5, $Pieza6, $Pieza7, $Pieza8, $Pieza9]
	resuelto = piezas.duplicate()


func _on_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.button_index == 1):
		mouse = event
