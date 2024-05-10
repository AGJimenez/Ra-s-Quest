extends Node2D

var wall = false
var change = false

func _ready():
	if(Global.complete && !change):
		$wall_puzzle/PointLight2D/AnimationPlayer.play("change")
		$door.visible = false
		$door/CollisionShape2D.disabled = true
		change = true
	if Global.change == "chest-night":
		$room/Player.global_position = $"Spawn_points/chest-night".global_position
	
	if Global.change == "torch-night":
		$room/Player.global_position = $"Spawn_points/torch-night".global_position
	
	if Global.change == "wall_puzzle-night":
		$room/Player.global_position = $"Spawn_points/wall_puzzle-night".global_position

func _process(_delta):
	if(Input.is_action_just_pressed("Interact") && !change):
		if(wall):
			LoadManager.load_scene("res://Escenas/Luis/Puzzles/wall_puzzle.tscn")


func _on_night_area_chest_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "night-chest"
		LoadManager.load_scene("res://Escenas/Luis/Rooms/chest_room.tscn")


func _on_night_area_torch_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "night-torch"
		LoadManager.load_scene("res://Escenas/Luis/Rooms/torch_room.tscn")


func _on_wall_puzzle_body_entered(body):
	if(body.is_in_group("Player") && !change):
		wall = true
		$room/Player/interact.visible = true


func _on_wall_puzzle_body_exited(body):
	if(body.is_in_group("Player")):
		wall = false
		$room/Player/interact.visible = false
