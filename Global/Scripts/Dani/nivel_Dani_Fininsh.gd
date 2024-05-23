extends Node2D

var purple_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("Interact") && purple_area && !Global.easter_egg_dani):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Luis/easter_egg/second_gem.dialogue"), "cursed_gem_dialog")
		$easter_egg/purple_gem.visible = false
		$easter_egg/purple_gem/CollisionShape2D.disabled = true
		Global.easter_egg_dani = true


func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "nivel_Dani_Final-chest_room"
		LoadManager.load_scene("res://Escenas/Luis/Rooms/chest_room.tscn")


func _on_purple_area_body_entered(body):
	if(body.is_in_group("Player") && !Global.easter_egg_dani):
		purple_area = true
		$Personaje/Control.visible = true

func _on_purple_area_body_exited(body):
	if(body.is_in_group("Player") && !Global.easter_egg_dani):
		purple_area = false
		$Personaje/Control.visible = false
