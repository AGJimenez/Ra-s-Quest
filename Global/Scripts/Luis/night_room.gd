extends Node2D

var wall = false
var dialog_end = false

func _ready():
	if(Global.complete):
		$wall_puzzle/PointLight2D/AnimationPlayer.play("change")
		$door.visible = false
		$door/CollisionShape2D.disabled = true
		Global.door_disable = true

	if Global.change == "chest-night":
		$room/Player.global_position = $"Spawn_points/chest-night".global_position
	
	if Global.change == "torch-night":
		$room/Player.global_position = $"Spawn_points/torch-night".global_position
	
	if Global.change == "wall_puzzle-night":
		$room/Player.global_position = $"Spawn_points/wall_puzzle-night".global_position

func _process(_delta):
	if(Input.is_action_just_pressed("Interact") && !Global.door_disable):
		if(wall):
			LoadManager.load_scene("res://Escenas/Luis/Puzzles/wall_puzzle.tscn")
	if(Global.complete && !Global.anubis_dialog_end  && Global.door_disable):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Luis/night_room/anubis_back.dialogue"), "anubis_dialog")
		Global.anubis_dialog_end = true
	if(Global.dialogue_state == true):
		$room/Player.velocity = Vector2.ZERO
		$room/Player.set_physics_process(false)
	if(Global.dialogue_state == false):
		$room/Player.set_physics_process(true)


func _on_night_area_chest_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "night-chest"
		LoadManager.load_scene("res://Escenas/Luis/Rooms/chest_room.tscn")


func _on_night_area_torch_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "night-torch"
		LoadManager.load_scene("res://Escenas/Luis/Rooms/torch_room.tscn")


func _on_wall_puzzle_body_entered(body):
	if(body.is_in_group("Player") && !Global.door_disable):
		wall = true
		$room/Player/interact.visible = true


func _on_wall_puzzle_body_exited(body):
	if(body.is_in_group("Player")):
		wall = false
		$room/Player/interact.visible = false
