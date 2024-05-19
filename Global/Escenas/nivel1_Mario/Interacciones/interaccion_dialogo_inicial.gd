extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body is Personaje:
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/nivelMario/dialogo_inicial.dialogue"), "dialogo_inicial")
		queue_free()
