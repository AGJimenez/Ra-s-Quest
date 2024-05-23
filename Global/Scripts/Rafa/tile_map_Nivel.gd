extends TileMap

var puerta_hecha = false

func _process(delta):
	if(Globals.completados == 4 && !puerta_hecha):
		pass#quitar cuando este relleno el if
		#puerta.visible = false
		#puerta/collision.disabled = true
		#puerta_hecha = true

	#if(player entra en area)
	#loadmanager.load_level("chest_room")
