extends Panel

@onready var nivel_Mario = get_tree().get_root().get_node("nivelMario")

func _ready():
	pass

func _on_button_pressed():
	nivel_Mario.signal_button_pressed.emit()
