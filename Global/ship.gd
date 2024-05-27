extends CharacterBody2D
 
@export var bullet_node: PackedScene
var mouse_position = Vector2.ZERO
var direction = Vector2.ZERO

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
	if event.is_action("LeftClick"):
		shoot()	
