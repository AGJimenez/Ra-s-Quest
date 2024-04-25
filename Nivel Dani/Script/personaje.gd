extends CharacterBody2D
class_name Personaje

var speed = 120
var direccion = Vector2.ZERO
var lastDirection = ""
var on_area_cofre=false
var on_area_balanza=false
@onready var anim = $AnimatedSprite2D

# MÉTODO ASIGNACIÓN DIRECCIONES
func _physics_process(delta):
	direccion = Vector2.ZERO

	if Input.is_action_pressed("Left"):
		direccion.x -= 1
		lastDirection = "Left"
	if Input.is_action_pressed("Right"):
		direccion.x += 1
		lastDirection = "Right"
	if Input.is_action_pressed("Up"):
		direccion.y -= 1
		lastDirection = "Up"
	if Input.is_action_pressed("Down"):
		direccion.y += 1
		lastDirection = "Down"

	velocity = direccion * speed
	
	interaccion()
	update_animation()
	move_and_slide()

# MÉTODO MOVIMIENTO
func update_animation():
	if direccion != Vector2.ZERO:
		anim.play("move" + lastDirection)
	else:
		anim.play("stop" + lastDirection)


func interaccion_con_cofre():
	var panel_visible : Panel = $Camera2D/Panel
	if panel_visible.visible:
		panel_visible.visible = false
	else:
		panel_visible.visible = true
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/panel_respuesta.dialogue"),"main")

func interaccion():
	if on_area_cofre ==true and Input.is_action_just_pressed("Interactuar"):
		print("DALE A LA E")
		interaccion_con_cofre()
	elif on_area_balanza==true and Input.is_action_just_pressed("Interactuar"):
		interaccion_con_balanza()

func interaccion_con_balanza():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/interaccion_con_balanza.dialogue"),"main")



func _on_area_cofres_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_2_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_2_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_3_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_3_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_4_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_4_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_5_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_5_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_6_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_6_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_balanza_maat_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_balanza=true
func _on_balanza_maat_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_balanza=false
func _on_area_cofres_vertical_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_2_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_2_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_3_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_3_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_4_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_4_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_5_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_5_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_6_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_6_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_7_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_7_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_8_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_8_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_9_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_9_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
