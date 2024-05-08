extends Node2D

@onready var cpu_particles = $Player/Camera2D/CPUParticles2D
@onready var cpu_particles2 = $Player/Camera2D/CPUParticles2D2


func _ready():
	$Timer.start(2)

func _on_timer_timeout():
	cpu_particles.emitting = false
	cpu_particles2.emitting = true
	$Timer2.start(2)


func _on_timer_2_timeout():
	cpu_particles2.emitting = false
	cpu_particles.amount = 500
	cpu_particles.emitting = true
	$Timer3.start(2)

func _on_timer_3_timeout():
	cpu_particles.emitting = false
	cpu_particles2.amount = 1000
	cpu_particles2.emitting = true
