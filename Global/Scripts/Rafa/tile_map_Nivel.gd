extends TileMap

var puerta_hecha = false
@export_group("Personaje")
@export var personaje: CharacterBody2D
@export_group("Spawns")
@export var marker_perro: Marker2D
@export var marker_gato: Marker2D
@export var marker_tortuga: Marker2D
@export var marker_humano: Marker2D

func _ready():
	if(Global.change == "perro-tile_map_Nivel"):
		personaje.global_position = marker_perro.global_position
	if(Global.change == "gato-tile_map_Nivel"):
		personaje.global_position = marker_gato.global_position
	if(Global.change == "tortuga-tile_map_Nivel"):
		personaje.global_position = marker_tortuga.global_position
	if(Global.change == "objects-tile_map_Nivel"):
		personaje.global_position = marker_humano.global_position

func _process(delta):
	if(Globals.completados == 4 && !puerta_hecha):
		pass#quitar cuando este relleno el if
		#puerta.visible = false
		#puerta/collision.disabled = true
		#puerta_hecha = true

	#if(player entra en area)
	#loadmanager.load_level("chest_room")
