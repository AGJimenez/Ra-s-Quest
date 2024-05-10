extends Node2D

var fraction

func _ready():
	fraction = Global.fractions[Global.random[2]]
	Global.green_fraction = fraction

func _on_interaction_area_body_entered(body):
	if(body.is_in_group("Player")):
		Global.flower = "green"
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Luis/night_room/flower_dialog.dialogue"), "flower_dialog")

func _on_interaction_area_body_exited(body):
	if(body.is_in_group("Player")):
		Global.flower = "blank"
