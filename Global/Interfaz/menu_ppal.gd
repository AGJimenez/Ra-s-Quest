extends Control

var paused = false

func _ready():
	Save.load_game()
	var check = Save.save_dict["fullscreen"]
	if(check):
		$settings_menu/MarginContainer/VFlowContainer/act_deact.button_pressed = true
		$settings_menu/MarginContainer/VFlowContainer/act_deact.text = "Activado"

func _process(_delta):
	if(Save.save_dict["map"] == ""):
		$Continue.disabled = true
	else:
		$Continue.disabled = false


func _on_new_game_pressed():
	Save.delete_save()
	Save.save_dict["map"] = "res://Escenas/intro.tscn"
	Save.save_game()
	LoadManager.load_scene("res://Escenas/intro.tscn")


func _on_continue_pressed():
	LoadManager.load_scene(Save.save_dict["map"])


func _on_delete_save_pressed():
	$Control/delete_container.visible = true
	pauseMenu()


func _on_exit_pressed():
	get_tree().quit()


func pauseMenu():
	get_tree().paused = true


func resumeGame():
	get_tree().paused = false


func _on_no_pressed():
	resumeGame()
	$Control/delete_container.visible = false
	
	
func _on_yes_pressed():
	resumeGame()
	Save.save_dict["map"] = ""
	Save.delete_save()
	$Control/delete_container.visible = false


func _on_act_deact_toggled(toggled_on):
	if(toggled_on):
		$settings_menu/MarginContainer/VFlowContainer/act_deact.text = "Activado"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		$settings_menu/MarginContainer/VFlowContainer/act_deact.text = "Desactivado"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	Save.save_dict["fullscreen"] = toggled_on
	Save.save_game()


func _on_settings_pressed():
	$settings_menu.visible = !$settings_menu.visible
