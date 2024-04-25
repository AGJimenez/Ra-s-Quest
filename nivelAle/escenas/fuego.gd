extends StaticBody2D

func _ready():
	playAnim()

func playAnim():
	$AnimatedSprite2D.play("llama")
