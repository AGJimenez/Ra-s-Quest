extends StaticBody2D


func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "nivel_mario-nivel_Dani"
		LoadManager.load_scene("res://Escenas/Dani/nivel_Dani.tscn")
