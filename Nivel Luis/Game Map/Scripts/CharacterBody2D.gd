extends CharacterBody2D

@export var speed = 200
var direction: Vector2
var push_force = 120

func _process(delta):
	if(Global.dead && !Global.activated):
		set_physics_process(false)
		$Sprite2D.visible = false
		$AnimatedSprite2D.visible = true
		$AnimatedSprite2D.play("dead")
		Global.dead = false
		await get_tree().create_timer(1).timeout
		LoadManager.load_scene("res://Rooms/torch_room.tscn")
		
func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction
	if direction == Vector2.ZERO:
		velocity = Vector2.ZERO
		push_force = 0
		
	else:
		direction = direction.normalized()  # Normalize direction vector
		velocity = direction * speed
		push_force = 120
		
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision.get_collider() is RigidBody2D):
			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)
