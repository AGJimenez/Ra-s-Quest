extends Control

func _process(delta):
	if(Input.is_action_just_pressed("interact")):
		Global.change = "chest_puzzle-chest"
		LoadManager.load_scene("res://Rooms/chest_room.tscn")
