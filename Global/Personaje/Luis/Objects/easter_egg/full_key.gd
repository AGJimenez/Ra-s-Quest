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

func init_particles_NW():
	particles_NW.emitting = true

func init_particles_NE():
	particles_NE.emitting = true
	
func init_particles_SE():
	particles_SE.emitting = true
	
func init_particles_SW():
	particles_SW.emitting = true


func _on_torch_room_key_complete():
	await get_tree().create_timer(1).timeout
	cursed_particles.visible = true
	await get_tree().create_timer(4).timeout
	self.visible = false
	get_tree().paused = false


func _on_torch_room_mario_piece():
	self.visible = true
	get_tree().paused = true
	anim.play("SW_anim")
	SW.visible = true
	await anim.animation_finished
	if(Global.pieces_collected != 4):
		self.visible = false
		get_tree().paused = false
	
func _on_torch_room_dani_piece():
	self.visible = true
	get_tree().paused = true
	anim.play("NW_anim")
	NW.visible = true
	await anim.animation_finished
	if(Global.pieces_collected != 4):
		self.visible = false
		get_tree().paused = false

func _on_torch_room_rafa_piece():
	self.visible = true
	get_tree().paused = true
	anim.play("NE_anim")
	NE.visible = true
	await anim.animation_finished
	if(Global.pieces_collected != 4):
		self.visible = false
		get_tree().paused = false

func _on_torch_room_luis_piece():
	self.visible = true
	get_tree().paused = true
	anim.play("SE_anim")
	SE.visible = true
	await anim.animation_finished
	if(Global.pieces_collected != 4):
		self.visible = false
		get_tree().paused = false

