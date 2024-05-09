extends Node2D

@onready var label = $Label

func _ready():
	label.text = Global.fractions[Global.random[3]]

func _on_interaction_area_body_entered(body):
	if(body.is_in_group("Player")):
		label.visible = true


func _on_interaction_area_body_exited(body):
	if(body.is_in_group("Player")):
		label.visible = false
