extends Node

signal save_icon

var save_dict = {
	"map": "",
	"map_number" : 0,
	"easter_egg_try_save": true,
	"fullscreen": false,
	"gem_mario": false,
	"gem_dani": false,
	"gem_rafa": false,
	"gem_luis": false,
	"key_collected": false,
	"ended": false
	}

func save():
	save_dict
	return save_dict

func save_game():
	var save_game = FileAccess.open_encrypted_with_pass("user://savegame.save", FileAccess.WRITE, "Ra")
	
	var json_string = JSON.stringify(save())
	
	save_game.store_line(json_string)
	
	emit_signal("save_icon")

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_game = FileAccess.open_encrypted_with_pass("user://savegame.save", FileAccess.READ, "Ra")
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		if("ended" in node_data):
			save_dict["ended"] = node_data["ended"]
		if("gem_mario" in node_data):
			save_dict["gem_mario"] = node_data["gem_mario"]
		if("gem_dani" in node_data):
			save_dict["gem_dani"] = node_data["gem_dani"]
		if("gem_rafa" in node_data):
			save_dict["gem_rafa"] = node_data["gem_rafa"]
		if("gem_luis" in node_data):
			save_dict["gem_luis"] = node_data["gem_luis"]
		if("key_collected" in node_data):
			save_dict["key_collected"] = node_data["key_collected"]
		if("easter_egg_try_save" in node_data):
			save_dict["easter_egg_try_save"] = node_data["easter_egg_try_save"]
		if("map" in node_data):
			save_dict["map"] = node_data["map"]
		if("map_number" in node_data):
			save_dict["map_number"] = node_data["map_number"]
		if("fullscreen" in node_data):
			save_dict["fullscreen"] = node_data["fullscreen"]
			if(save_dict["fullscreen"]):
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			else:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func delete_save():
	DirAccess.remove_absolute("user://savegame.save")
