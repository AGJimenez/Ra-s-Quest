extends Node2D

var chest = false
var easter_egg = false
var easter_egg_try = true
var cancion = preload("res://Assets/sounds/mario2.mp3")
@export var cursed_particles: CPUParticles2D

func _ready():
	MusicGlobal.play_music_level(cancion)
	if(Global.doom_bool):
		end()
	if(Global.pieces_collected == 4 && !Global.doom_bool):
		cursed_particles.emitting = true
	if(Save.save_dict["map_number"] < 4):
		number_changed()
		Save.save_dict["map"] = "res://Escenas/Luis/Rooms/chest_room.tscn"
		Save.save_game()
	if Global.change == "night-chest":
		$room/Player.global_position = $"Spawn_points/night-chest".global_position
	
	if Global.change == "easter_egg-chest":
		$room/Player.global_position = $"Spawn_points/easter_egg-chest".global_position
	
	if Global.change == "chest_puzzle-chest":
		$room/Player.global_position = $"Spawn_points/chest_puzzle-chest".global_position

func _process(_delta):
	if(!Global.doom_bool):
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
			else:
				LoadManager.load_scene("res://Escenas/Luis/Puzzles/easter_egg_puzzle.tscn")
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
	else:
		$room/Player.set_physics_process(false)
		


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
	if(body.is_in_group("Player")&& !Global.doom_bool && easter_egg_try && Save.save_dict["easter_egg_try_save"]):
		easter_egg = true
		$room/Player/interact.visible = true


func _on_easter_egg_chest_body_exited(body):
	if(body.is_in_group("Player")):
		easter_egg = false
		$room/Player/interact.visible = false

func end():
	Save.save_dict["ended"] = true
	Save.save_dict["map"] = ""
	Save.save_game()
	for i in $particles.get_child_count():
		await get_tree().create_timer(1).timeout
		var j = $particles.get_child(i)
		if(j is CPUParticles2D):
			j.emitting = true
		if(j is Node2D):
			j.visible = true
	await get_tree().create_timer(2).timeout
	Save.delete_save()
	get_tree().quit()
