extends Panel
class_name Puzle1

@onready var nivel_mario = get_tree().get_root().get_node("nivelMario")

func _ready():
	pass

func _on_button_pressed():
	nivel_mario.signal_button_pressed.emit()
