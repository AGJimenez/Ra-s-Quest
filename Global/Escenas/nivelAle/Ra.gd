extends Sprite2D

var draggin = false
var of  = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggin:
		position = get_global_mouse_position() - of


func _on_button_button_down():
	draggin = true
	of = get_global_mouse_position() - global_position


func _on_button_button_up():
	draggin = false
