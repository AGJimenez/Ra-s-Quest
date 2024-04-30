extends Control

func _process(delta):
	if(Input.is_action_just_pressed("interact")):
		Global.change = "wall_puzzle-night"
		LoadManager.load_scene("res://Rooms/night_room.tscn")
