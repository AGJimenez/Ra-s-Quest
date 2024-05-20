extends Node2D

var chest = false
var easter_egg = false
var easter_egg_try = true

func _ready():
	if(Save.save_dict["map_number"] < 4):
		number_changed()
		Save.save_dict["map"] = "res://Escenas/Luis/Rooms/chest_room.tscn"
		Save.save_game()
	if Global.change == "night-chest":
		$room/Player.global_position = $"Spawn_points/night-chest".global_position
		
	if Global.change == "chest_puzzle-chest":
		$room/Player.global_position = $"Spawn_points/chest_puzzle-chest".global_position

func _process(_delta):
	if(Input.is_action_just_pressed("Interact") && !Global.gain_torch_end):
		if(chest):
			LoadManager.load_scene("res://Escenas/Luis/Puzzles/chest_puzzle.tscn")
	if(Input.is_action_just_pressed("Interact") && easter_egg && easter_egg_try && Save.save_dict["easter_egg_try_save"]):
		if(Global.not_prepared):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Luis/chest_room/not_prepared.dialogue"), "not_prepared_dialog")
			easter_egg_try = false
			$room/Player/interact.visible = false
			Save.save_dict["easter_egg_try_save"] = false
			Save.save_game()
	if(Global.chest_puzzle_complete):
		$night_entrance/StaticBody2D/CollisionShape2D.disabled = true
		if(!Global.gain_torch_end):
			Global.gain_torch_end = true
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Luis/chest_room/gain_torch.dialogue"), "gain_torch_dialog")

	if(Global.dialogue_state == true):
		$room/Player.velocity = Vector2.ZERO
		$room/Player.direction = Vector2.ZERO
		if(Global.gain_torch_end && !easter_egg):
			$"little torch".visible = true
		$room/Player.set_physics_process(false)
	if(Global.dialogue_state == false):
		$"little torch".visible = false
		$room/Player.set_physics_process(true)
		


func _on_chest_area_night_body_entered(body):
	if(body.is_in_group("Player")):
		if(Global.chest_puzzle_complete):
			Global.change = "chest-night"
			LoadManager.load_scene("res://Escenas/Luis/Rooms/night_room.tscn")


func _on_chest_puzzle_body_entered(body):
	if(body.is_in_group("Player") && !Global.gain_torch_end):
		chest = true
		$room/Player/interact.visible = true


func _on_chest_puzzle_body_exited(body):
	if(body.is_in_group("Player") && !Global.gain_torch_end):
		chest = false
		$room/Player/interact.visible = false


func _on_not_torch_area_body_entered(body):
	if(body.is_in_group("Player")):
		if(!Global.chest_puzzle_complete):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Luis/chest_room/not_torch.dialogue"), "not_torch_dialog")



func _on_not_torch_area_body_exited(body):
	if(body.is_in_group("Player")):
		if(!Global.chest_puzzle_complete):
			pass

func number_changed():
	Save.save_dict["map_number"] = 4


func _on_easter_egg_chest_body_entered(body):
	if(body.is_in_group("Player") && Global.not_prepared && easter_egg_try && Save.save_dict["easter_egg_try_save"]):
		easter_egg = true
		$room/Player/interact.visible = true


func _on_easter_egg_chest_body_exited(body):
	if(body.is_in_group("Player")):
		easter_egg = false
		$room/Player/interact.visible = false
