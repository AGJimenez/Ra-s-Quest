extends CanvasLayer

var pause = false
var quit = false

func _process(_delta):
	if(Input.is_action_just_pressed("pausa") && !Global.dialogue_state && !quit):
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
