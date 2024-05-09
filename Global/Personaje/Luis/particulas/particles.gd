extends Node2D

@onready var cpu_particles = $Player/Camera2D/CPUParticles2D


func _ready():
	$Timer.start(2)

func _on_timer_timeout():
	cpu_particles.emitting = false
	$Timer2.start(2)


func _on_timer_2_timeout():
	cpu_particles.amount = 500
	cpu_particles.emitting = true
	$Timer3.start(2)

func _on_timer_3_timeout():
	cpu_particles.emitting = false
