extends CharacterBody2D

var rotateSpeed = 0.5
var currentRotation = 0.0
var isRotating = false

func rotateMirror(delta):
	rotate(rotateSpeed*delta)
	currentRotation += rotateSpeed * delta
	if currentRotation >= 360:
		currentRotation = 0

