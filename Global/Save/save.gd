extends Node


var save_dict = {
	"map": "",
	"map_number" : 0,
	"easter_egg_try_save": true
	}

func save():
	save_dict
	return save_dict

func save_game():
	var save_game = FileAccess.open_encrypted_with_pass("user://savegame.save", FileAccess.WRITE, "Ra")
	
	var json_string = JSON.stringify(save())
	
	save_game.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_game = FileAccess.open_encrypted_with_pass("user://savegame.save", FileAccess.READ, "Ra")
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		save_dict["easter_egg_try_save"] = node_data["easter_egg_try_save"]
		save_dict["map_number"] = node_data["map_number"]
		LoadManager.load_scene(node_data["map"])
		

func delete_save():
	DirAccess.remove_absolute("user://savegame.save")
