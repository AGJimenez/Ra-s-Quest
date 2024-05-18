extends Panel

@onready var nivel_Mario = get_tree().get_root().get_node("nivelMario")

func _ready():
	pass

func _on_boton_ojo_horus_pressed():
	nivel_Mario.signal_problema_ojohorus.emit()
