extends Node2D

var chest = false

func _ready():
	if Global.change == "night-chest":
		$room/Player.global_position = $"Spawn_points/night-chest".global_position
		
	if Global.change == "chest_puzzle-chest":
		$room/Player.global_position = $"Spawn_points/chest_puzzle-chest".global_position

func _process(delta):
	if(Input.is_action_just_pressed("interact")):
		if(chest):
			LoadManager.load_scene("res://Puzzles/chest_puzzle.tscn")


func _on_chest_area_night_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "chest-night"
		LoadManager.load_scene("res://Rooms/night_room.tscn")


func _on_chest_puzzle_body_entered(body):
	if(body.is_in_group("Player")):
		chest = true
		$room/Player/interact.visible = true


func _on_chest_puzzle_body_exited(body):
	if(body.is_in_group("Player")):
		chest = false
		$room/Player/interact.visible = false

