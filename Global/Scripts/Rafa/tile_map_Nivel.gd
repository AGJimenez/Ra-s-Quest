extends TileMap



@export_group("Personaje")
@export var personaje: CharacterBody2D
@export_group("Spawns")
@export var marker_perro: Marker2D
@export var marker_gato: Marker2D
@export var marker_tortuga: Marker2D
@export var marker_humano: Marker2D
var cancion = preload("res://Assets/sounds/Desert Dreams rafa.mp3")

func _ready():
	MusicGlobal.play_music_level(cancion)
	if(Global.change == "perro-tile_map_Nivel"):
		personaje.global_position = marker_perro.global_position
	if(Global.change == "gato-tile_map_Nivel"):
		personaje.global_position = marker_gato.global_position
	if(Global.change == "tortuga-tile_map_Nivel"):
		personaje.global_position = marker_tortuga.global_position
	if(Global.change == "objects-tile_map_Nivel"):
		personaje.global_position = marker_humano.global_position

var purple_area: bool = false
@onready var interact_label: Control = $Personaje/Control


func _process(delta):
	if(Input.is_action_just_pressed("Interact") && purple_area && !Save.save_dict["gem_rafa"]):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/easter_egg/third_gem.dialogue"), "cursed_gem_dialog")
		interact_label.visible = false
		Save.save_dict["gem_rafa"] = true
		Save.save_game()
		$easter_egg.queue_free()
		

	if(Globals.completados == 4 && Globals.puerta_hecha==false):
		$easter_egg.visible = true
		$puerta.visible = false
		$puerta_collision/CollisionShape2D.disabled = true
		Globals.puerta_hecha = true


func _on_purple_area_body_entered(body):
	if(body.is_in_group("Player") && !Save.save_dict["gem_rafa"]):
		if($easter_egg.visible):
			purple_area = true
			interact_label.visible = true


func _on_purple_area_body_exited(body):
	if(body.is_in_group("Player") && !Save.save_dict["gem_rafa"]):
		if($easter_egg.visible):
			purple_area = false
			interact_label.visible = false
