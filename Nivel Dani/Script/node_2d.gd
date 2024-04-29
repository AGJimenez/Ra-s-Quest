extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():	
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Conversacion_Principal.dialogue"),"main")
	var nueva_posicion = Vector2(88, 0) # Nueva posición deseada
	self.position = nueva_posicion


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

