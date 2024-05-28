extends CharacterBody2D
 
@export var bullet_node: PackedScene
var mouse_position = Vector2.ZERO
var direction = Vector2.ZERO
@onready var progress_bar = $ProgressBar

var health = 100:
	set(value):
		health = value
		progress_bar.value = value
		if health <= 0:
			die()


func _physics_process(_delta):
	
	velocity = Input.get_vector("Left","Right","Up","Down") * 250
	mouse_position = get_global_mouse_position()
	direction = (mouse_position - global_position).normalized()
	look_at(mouse_position)
	move_and_slide()
	
func shoot():
	var bullet = bullet_node.instantiate()
 
	bullet.position = global_position
	bullet.direction = (get_global_mouse_position() - global_position).normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)
 
func _input(event):
	if event.is_action("RightClick"):
		shoot()	

func take_damage():
	health -= 10

func die():
	print("Muelto")
	$gameover.visible = true

func _on_area_2d_body_entered(body):
	if body.name == "skeleton":
		print("Skeleton")
		take_damage()
		



func _on_area_2d_area_entered(area):
	if area.name == "projectile":
		print("PROYECTIL")
		take_damage()
