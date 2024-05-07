extends Node2D

var on_area_cofre=false
var on_area_balanza=false
@onready var panel = get_node("Personaje/Camera2D/Panel")
# Called when the node enters the scene tree for the first time.
func _ready():	
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/Conversacion_Principal.dialogue"),"main")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	interaccion()


func interaccion_con_cofre():
	if panel.visible:
		panel.visible = false
	else:
		panel.visible = true
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/panel_respuesta.dialogue"),"main")

func interaccion():
	if on_area_cofre ==true and Input.is_action_just_pressed("Interact"):
		print("DALE A LA E")
		interaccion_con_cofre()
	elif on_area_balanza==true and Input.is_action_just_pressed("I"):
		interaccion_con_balanza()

func interaccion_con_balanza():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/interaccion_con_balanza.dialogue"),"main")


func _on_area_cofres_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres
		print("TUS MUERTOS")


func _on_area_cofres_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_2_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres2
		print("TUS MUERTOS")


func _on_area_cofres_2_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_3_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres3
		print("TUS MUERTOS")


func _on_area_cofres_3_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_4_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres4
		print("TUS MUERTOS")


func _on_area_cofres_4_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical
		print("TUS MUERTOS")


func _on_area_cofres_vertical_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_2_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical2
		print("TUS MUERTOS")


func _on_area_cofres_vertical_2_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_3_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area = $Cofres/area_cofres_vertical3
		print("TUS MUERTOS")


func _on_area_cofres_vertical_3_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_4_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical4
		print("TUS MUERTOS")


func _on_area_cofres_vertical_4_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_5_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical5
		print("TUS MUERTOS")


func _on_area_cofres_vertical_5_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_6_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical6
		print("TUS MUERTOS")


func _on_area_cofres_vertical_6_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_7_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical7
		print("TUS MUERTOS")


func _on_area_cofres_vertical_7_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_8_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical8
		print("TUS MUERTOS")


func _on_area_cofres_vertical_8_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_area_cofres_vertical_9_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=true
		panel.ultima_Area=$Cofres/area_cofres_vertical9
		print("TUS MUERTOS")


func _on_area_cofres_vertical_9_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_balanza_maat_body_entered(body):
	if(body.is_in_group("Personaje")):
		on_area_balanza=true


func _on_balanza_maat_body_exited(body):
	if(body.is_in_group("Personaje")):
		on_area_cofre=false


func _on_introduccion_area_body_entered(body):
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/interaccion_con_Anubis.dialogue"),"main")


func _on_introduccion_area_body_exited(body):
	$introduccion_area.queue_free()
