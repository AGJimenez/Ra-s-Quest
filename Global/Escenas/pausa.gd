extends Control

@onready var main = load("res://Escenas/intro.gd").new()

func _on_resume_pressed():
	main.resumeGame()


func _on_reload_pressed():
	main.reloadLevel()


func _on_quit_pressed():
	main.quitGame()
