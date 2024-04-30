extends CharacterBody2D

var speed = 40
var current_state
var direction : Vector2
var random
var dead = false
var push_force = 120
@onready var anim = $skelyboy
@onready var aura = $aura

enum enemy_states{
	IDLE,
	LEFT,
	RIGHT,
	UP,
	DOWN
}

func _process(delta):
	if (Global.activated && !dead):
		set_physics_process(false)
		anim.play("death")
		dead = true
		aura.stop()
		aura.visible = false
	if(dead):
		pass
func _physics_process(delta):
	match current_state:
		enemy_states.IDLE:
			velocity = Vector2.ZERO
			anim.play("idle")
			push_force = 0
		enemy_states.LEFT:
			direction.x = 1
			velocity = direction * speed
			anim.play("right")
			push_force = 120
		enemy_states.RIGHT:
			direction.x = -1
			velocity = direction * speed
			anim.play("left")
			push_force = 120
		enemy_states.UP:
			direction.y = -1
			velocity = direction * speed
			anim.play("up")
			push_force = 120
		enemy_states.DOWN:
			direction.y = 1
			velocity = direction * speed
			anim.play("down")
			push_force = 120
	_random()
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision.get_collider() is RigidBody2D):
			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)

func _random():
	match random:
		0:
			current_state = enemy_states.DOWN
		1:
			current_state = enemy_states.UP
		2:
			current_state = enemy_states.LEFT
		3:
			current_state = enemy_states.RIGHT
		4:
			current_state = enemy_states.IDLE


func _on_timer_timeout():
	random = randi() % 5
	$Timer.wait_time = 2


func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player") && !Global.dead):
		Global.dead = true
