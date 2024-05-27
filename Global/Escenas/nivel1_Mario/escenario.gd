extends Node2D

var purple_area: bool = false
@onready var interact_label: Control = $TileMap/Personaje/Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("Interact") && purple_area && !Save.save_dict["gem_mario"]):
		if($easter_egg.visible):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/easter_egg/first_gem.dialogue"), "cursed_gem_dialog")
			interact_label.visible = false
			Save.save_dict["gem_mario"] = true
			Save.save_game()
			$easter_egg.queue_free()

func _on_purple_area_body_entered(body):
	if(body.is_in_group("Player") && !Save.save_dict["gem_mario"]):
		if($easter_egg.visible):
			purple_area = true
			interact_label.visible = true


func _on_purple_area_body_exited(body):
	if(body.is_in_group("Player") && !Save.save_dict["gem_mario"]):
		if($easter_egg.visible):
			purple_area = false
			interact_label.visible = false
