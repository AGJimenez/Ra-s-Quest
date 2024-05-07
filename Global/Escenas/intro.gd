extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("new_animation")
	$Personaje/Camera2D.enabled = false
	$AnimationPlayer2.play("camara")
	await get_tree().create_timer(5).timeout
	$Camera2D.enabled = false
	$Personaje/Camera2D.enabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
