extends CanvasLayer

var pause = false
var quit = false

func _ready():
	var check = Save.save_dict["fullscreen"]
	if(check):
		$pause_control/settings_menu/MarginContainer/VFlowContainer/act_deact.button_pressed = true
		$pause_control/settings_menu/MarginContainer/VFlowContainer/act_deact.text = "Activado"

func _process(_delta):
	if(Input.is_action_just_pressed("pausa") && !Global.dialogue_state && !quit && !Global.doom_bool):
		if(!pause):
			pauseMenu()
		else:
			resumeGame()

func pauseMenu():
	self.visible = true
	pause = true
	get_tree().paused = true


func resumeGame():
	self.visible = false
	pause = false
	get_tree().paused = false


func reloadLevel():
	Global.tutorial_on = false
	Global.controls_wasd = false
	Global.controls_e = false
	Global.controls_add = false
	get_tree().paused = false
	get_tree().reload_current_scene()
	self.visible = false


func quitGame():
	quit = true
	get_tree().paused = false
	self.visible = false
	LoadManager.load_scene("res://Interfaz/menu_ppal.tscn")


func _on_continue_pressed():
	resumeGame()


func _on_reload_pressed():
	reloadLevel()


func _on_quit_pressed():
	quitGame()


func _on_settings_pressed():
	$pause_control/settings_menu.visible = !$pause_control/settings_menu.visible


func _on_act_deact_toggled(toggled_on):
	if(toggled_on):
		$pause_control/settings_menu/MarginContainer/VFlowContainer/act_deact.text = "Activado"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		$pause_control/settings_menu/MarginContainer/VFlowContainer/act_deact.text = "Desactivado"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	Save.save_dict["fullscreen"] = toggled_on
	Save.save_game()
