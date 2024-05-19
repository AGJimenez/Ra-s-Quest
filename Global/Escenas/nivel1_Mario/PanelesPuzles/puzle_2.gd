extends Area2D
class_name Puzle2

var piezas = []
var resuelto = []
var mouse = false

@onready var nivel_Mario = get_tree().get_root().get_node("nivelMario")


func _ready():
	comenzar_puzle()


func _process(_delta):
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse):
		var mouse_copy = mouse
		mouse = false
		var rows = int(mouse_copy.position.y / 128 ) - 1
		var cols = int(mouse_copy.position.x / 128 ) - 3
		check_blank_space(rows, cols)
		if piezas == resuelto:
			nivel_Mario.signal_puzle2.emit()


func comenzar_puzle():
	piezas = [$Pieza1, $Pieza2, $Pieza3, $Pieza4, $Pieza5, $Pieza6, $Pieza7, $Pieza8, $Pieza9]
	resuelto = piezas.duplicate()
	shuffle_tiles()


func shuffle_tiles():
	var previous = 999
	var previous_1 = 998
	for t in range (0, 1000):
		var tile = randi() % 9
		if (piezas[tile] != $Pieza7 and tile != previous and tile != previous_1):
			var rows = int(piezas[tile].position.y / 80)
			var cols = int(piezas[tile].position.x / 80)
			check_blank_space(rows, cols)
			previous_1 = previous
			previous_1 = tile



func check_blank_space(rows, cols):
	var empty = false
	var done = false
	var pos = rows * 3 + cols
	while (!empty and !done):
		var new_pos = piezas[pos].position
		if (rows < 2):
			new_pos.y += 80
			empty = find_empty(new_pos, pos)
			new_pos.y -= 80
		if (rows > 0):
			new_pos.y -= 80
			empty = find_empty(new_pos, pos)
			new_pos.y += 80
		if (cols < 2):
			new_pos.x += 80
			empty = find_empty(new_pos, pos)
			new_pos.x -= 80
		if (cols > 0):
			new_pos.x -= 80
			empty = find_empty(new_pos, pos)
			new_pos.x += 80
		done = true



func find_empty(new_position, pos):
	var new_rows = int(new_position.y / 80) 
	var new_cols = int(new_position.x / 80) 
	var new_pos = new_rows * 3 + new_cols
	if (piezas[new_pos] == $Pieza7):
		swap_tiles(pos, new_pos)
		return true
	else:
		return false



func swap_tiles(tile_src, tile_dst):
	var temp_pos = piezas[tile_src].position
	piezas[tile_src].position = piezas[tile_dst].position
	piezas[tile_dst].position = temp_pos
	
	var temp_tile = piezas[tile_src]
	piezas[tile_src] = piezas[tile_dst]
	piezas[tile_dst] = temp_tile


func _on_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		mouse = event
