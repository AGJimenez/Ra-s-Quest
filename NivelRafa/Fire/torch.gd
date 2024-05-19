extends Node2D

var anim: AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	anim = get_node("torch").get_node("Fire")
	anim.play("Fire")
