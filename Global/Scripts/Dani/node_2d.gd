extends Node2D

var cancion = preload("res://Assets/sounds/puzzle dani.mp3")
var on_area_cofre=false
var on_area_balanza=false
var isFinalPuzzleEnabled = false
@onready var panel = get_node("Personaje/Camera2D/Panel")
@onready var camera = get_node("Personaje/Camera2D")
@onready var player = get_node("Personaje")
@onready var Sprite = get_node("StaticBody2D")
@onready var SpriteCollision = get_node("StaticBody2D/CollisionShape2D")
var nivelesSuperados = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicGlobal.play_music_level(cancion)
	if(Save.save_dict["map_number"] < 2):
		number_changed()
		Save.save_dict["map"] = "res://Escenas/Dani/node_2d.tscn"
		Save.save_game()
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/Conversacion_Principal.dialogue"),"main")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.dialogue_state == true):
		$Personaje.velocity = Vector2.ZERO
		$Personaje.direction = Vector2.ZERO
		$Personaje.set_physics_process(false)
	if(Global.dialogue_state == false):
		$Personaje.set_physics_process(true)
	interaccion()
	interaccion_con_cofre()
	if panel.numeroDePanelesSuperados == 4:
		quit_Espinas()
	elif panel.numeroDePanelesSuperados == 12:
		isFinalPuzzleEnabled = true
	if on_area_cofre == false:
		player.speed = panel.speedPlayer



func interaccion_con_cofre():
	if !Global.cofre:
		panel.visible = false
		player.speed = 100
	else:
		panel.visible = true
		player.speed = 0
		#DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta.dialogue"),"main")

func interaccion():
	if on_area_cofre == true and Input.is_action_just_pressed("Interact"):
		if(!Global.dialogue_state && !panel.visible):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/Interacción_Con_Cofre.dialogue"),"main")
		if Global.cofre:
			Global.cofre = false
	elif on_area_balanza==true and Input.is_action_just_pressed("Interact"):
		interaccion_con_balanza()

func interaccion_con_balanza():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/interaccion_con_balanza.dialogue"),"main")


func _on_area_cofres_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres


func _on_area_cofres_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_2_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres2


func _on_area_cofres_2_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_3_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres3


func _on_area_cofres_3_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_4_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres4


func _on_area_cofres_4_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical


func _on_area_cofres_vertical_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_2_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical2


func _on_area_cofres_vertical_2_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_3_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area = $Cofres/area_cofres_vertical3


func _on_area_cofres_vertical_3_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_4_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical4


func _on_area_cofres_vertical_4_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_5_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical5


func _on_area_cofres_vertical_5_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_6_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical6


func _on_area_cofres_vertical_6_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_7_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical7


func _on_area_cofres_vertical_7_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_8_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical8


func _on_area_cofres_vertical_8_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_9_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical9


func _on_area_cofres_vertical_9_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_balanza_maat_body_entered(body):
	if(body.is_in_group("Personaje")):
		if(panel.numeroDePanelesSuperados >= 12):
			on_area_balanza=true
			Global.change = "node_2d-sand_storm_world"
			LoadManager.load_scene("res://Escenas/Dani/alt_worlds/sand_storm_world.tscn")


func _on_introduccion_area_body_entered(body):
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/interaccion_con_Anubis.dialogue"),"main")


func _on_introduccion_area_body_exited(body):
	$introduccion_area.queue_free()

func quit_Espinas():
	Sprite.hide()
	SpriteCollision.disabled=true

func number_changed():
	Save.save_dict["map_number"] = 2
