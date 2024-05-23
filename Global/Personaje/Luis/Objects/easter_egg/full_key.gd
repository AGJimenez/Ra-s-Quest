extends Node2D

@export_group("Sprite")
@export var SW: Sprite2D
@export var SE: Sprite2D
@export var NW: Sprite2D
@export var NE: Sprite2D

@export_group("AnimationPlayer")
@export var anim: AnimationPlayer

@export_group("Particles")
@export var particles_NW: CPUParticles2D
@export var particles_NE: CPUParticles2D
@export var particles_SE: CPUParticles2D
@export var particles_SW: CPUParticles2D
@export_subgroup("Cursed")
@export var cursed_particles: Node2D

func _ready():
	anim.play("NW_anim")
	NW.visible = true
	await anim.animation_finished
	anim.play("NE_anim")
	NE.visible = true
	await anim.animation_finished
	anim.play("SE_anim")
	SE.visible = true
	await anim.animation_finished
	anim.play("SW_anim")
	SW.visible = true
	await anim.animation_finished
	cursed_particles.visible = true
	
	
func _process(delta):
	if(Input.is_action_just_pressed("Interact")):
		get_tree().reload_current_scene()
	

func init_particles_NW():
	particles_NW.emitting = true

func init_particles_NE():
	particles_NE.emitting = true
	
func init_particles_SE():
	particles_SE.emitting = true
	
func init_particles_SW():
	particles_SW.emitting = true
