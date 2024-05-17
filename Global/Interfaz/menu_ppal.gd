extends Control

var paused = false

func _process(delta):
	if(!FileAccess.file_exists("user://savegame.save")):
		$Continue.disabled = true
	else:
		$Continue.disabled = false


func _on_new_game_pressed():
	Save.save_dict["map"] = "res://Escenas/intro.tscn"
	Save.save_game()
	LoadManager.load_scene("res://Escenas/intro.tscn")


func _on_continue_pressed():
	Save.load_game()


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
	Save.delete_save()
	$Control/delete_container.visible = false
