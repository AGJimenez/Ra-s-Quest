extends Node2D

@onready var player= get_tree().get_first_node_in_group("player")
@onready var label= $Label


var base_text = "[E]"

var active_areas = []
var can_interact=true

func register_area (area: InteractionArea):
	active_areas.push_back(area)
	
	var path_completo: String = area.get_path()
	Globals.area=path_completo.substr(14,-1)
	
	if(Globals.puerta_hecha==true && Globals.area=="puertaFinal"):
		LoadManager.load_scene("res://Escenas/Luis/Rooms/chest_room.tscn")
	

func unregister_area(area:InteractionArea):
	var index = active_areas.find(area)
	if index !=-1:
		active_areas.remove_at(index)
		
		
func _process(_delta):
	
		if active_areas.size()>0 && can_interact:
			active_areas.sort_custom(_sort_by_distance_to_player)
			
			if(Globals.area=="puertaFinal"):
				base_text = ""
			else:
				base_text = "[E]"
			
			label.text = base_text
			label.global_position=active_areas[0].global_position
			label.global_position.y -=36
			label.global_position.x -= label.size.x / 2
			label.show()
		else:
			label.hide()

func _sort_by_distance_to_player(area1,area2):
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player

func _input(event):
	if event.is_action_pressed("Interact") && can_interact:
			
		if active_areas.size()>0:
			can_interact=false
			label.hide()
			if(Globals.area=="tortuga" && Globals.tortugaDone==false):
				Global.change = "tortuga-tile_map_Nivel"
				LoadManager.load_scene("res://Escenas/Rafa/"+Globals.area+"/main_scene.tscn")
			if(Globals.area=="gato" && Globals.gatoDone==false):
				Global.change = "gato-tile_map_Nivel"
				LoadManager.load_scene("res://Escenas/Rafa/"+Globals.area+"/main_scene.tscn")
			if(Globals.area=="objects" && Globals.objectsDone==false):
				Global.change = "objects-tile_map_Nivel"
				LoadManager.load_scene("res://Escenas/Rafa/"+Globals.area+"/main_scene.tscn")
			if(Globals.area=="perro" && Globals.perroDone==false):
				Global.change = "perro-tile_map_Nivel"
				LoadManager.load_scene("res://Escenas/Rafa/"+Globals.area+"/main_scene.tscn")
			await active_areas[0].interact.call()
		
			can_interact=true
