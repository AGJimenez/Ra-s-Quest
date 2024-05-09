extends Node2D

var chest = false
var done = true

func _ready():
	if Global.change == "night-chest":
		$room/Player.global_position = $"Spawn_points/night-chest".global_position
		
	if Global.change == "chest_puzzle-chest":
		$room/Player.global_position = $"Spawn_points/chest_puzzle-chest".global_position

func _process(delta):
	if(Input.is_action_just_pressed("Interact") && done):
		if(chest):
			LoadManager.load_scene("res://Escenas/Luis/Puzzles/chest_puzzle.tscn")
	if(Global.chest_puzzle_complete && done):
		done = false
		$night_entrance/StaticBody2D/CollisionShape2D.disabled = true
		$"little torch".visible = true
		$room/Player.set_physics_process(false)
		await get_tree().create_timer(4).timeout
		$"little torch".visible = false
		$room/Player.set_physics_process(true)


func _on_chest_area_night_body_entered(body):
	if(body.is_in_group("Player")):
		if(Global.chest_puzzle_complete):
			Global.change = "chest-night"
			LoadManager.load_scene("res://Escenas/Luis/Rooms/night_room.tscn")
		else:
			$room/Player/dialog_smth.visible = true

func _on_chest_area_night_body_exited(body):
	if(body.is_in_group("Player")):
		$room/Player/dialog_smth.visible = false

func _on_chest_puzzle_body_entered(body):
	if(body.is_in_group("Player") && done):
		chest = true
		$room/Player/interact.visible = true


func _on_chest_puzzle_body_exited(body):
	if(body.is_in_group("Player") && done):
		chest = false
		$room/Player/interact.visible = false



