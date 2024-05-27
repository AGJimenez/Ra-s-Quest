extends Node2D

var purple_area: bool = false
@onready var interact_label: Control = $Personaje/Control


func _process(delta):
	if(Input.is_action_just_pressed("Interact") && purple_area && !Save.save_dict["gem_dani"]):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/easter_egg/second_gem.dialogue"), "cursed_gem_dialog")
		interact_label.visible = false
		Save.save_dict["gem_dani"] = true
		Save.save_game()
		$easter_egg.queue_free()


func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "nivel_Dani_Final-tile_map_Nivel"
		LoadManager.load_scene("res://Escenas/Rafa/tile_map_Nivel.tscn")


func _on_purple_area_body_entered(body):
	if(body.is_in_group("Player") && !Save.save_dict["gem_dani"]):
		purple_area = true
		interact_label.visible = true
		


func _on_purple_area_body_exited(body):
	if(body.is_in_group("Player") && !Save.save_dict["gem_dani"]):
		purple_area = false
		interact_label.visible = false
