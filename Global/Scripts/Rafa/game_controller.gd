extends Node3D

var shapes_to_cycle_through = []
var index_selected = 0
var shape_to_fill: CSGPrimitive3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.piece_dropped_signal.connect(subtract_from_main)
	Globals.put_back_shapes.connect(show_shapes)
	Globals.level_complete.connect(on_level_complete)
	shape_to_fill = get_node("_shapeToFill")
	shapes_to_cycle_through = get_children()
	shapes_to_cycle_through = shapes_to_cycle_through.filter(
		func(node: Node): return node is CSGPrimitive3D and not node.name.begins_with("_")
	)
	set_state_at_current_index(true)

func set_state_at_current_index(new_state: bool):
	(shapes_to_cycle_through[index_selected] as MovingPiece).is_currently_selected = new_state


func on_level_complete():
	Globals.completados += 1
	await get_tree().create_timer(1).timeout
	LoadManager.load_scene("res://Escenas/Rafa/tile_map_Nivel.tscn")

func show_shapes():
	for shape in shapes_to_cycle_through:
		var current: CSGPrimitive3D = shape
		current.operation = CSGShape3D.OPERATION_UNION

func subtract_from_main():
	for shape in shapes_to_cycle_through:
		var current: CSGPrimitive3D = shape
		current.operation = CSGShape3D.OPERATION_SUBTRACTION
		current.reparent(shape_to_fill)
	Globals.check_answer.emit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_piece"):
		set_state_at_current_index(false)
		index_selected = (index_selected + 1) % shapes_to_cycle_through.size()
		set_state_at_current_index(true)
