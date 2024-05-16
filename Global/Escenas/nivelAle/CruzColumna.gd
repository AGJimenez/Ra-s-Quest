extends CharacterBody2D
signal col1
signal col2
signal col3
signal col4
signal col5
signal col6

var rotateSpeed = 0.5
var currentRotation = 0.0
var isRotating = true

func rotateMirror(delta):
	if isRotating == true:
		rotate(rotateSpeed*delta)
		currentRotation += rotateSpeed * delta
		print(currentRotation)
		if currentRotation >= 360:
			currentRotation = 0

func rotarCol1(delta):
	if currentRotation >= 1.63642045454543:
		isRotating = false
		emit_signal("col1")
	else:
		rotateMirror(delta)
		
func rotarCol2(delta):
	if currentRotation >= 3.13642045454543:
		isRotating = false
		emit_signal("col2")
	else:
		rotateMirror(delta)
		
func rotarCol3(delta):
	if currentRotation >= 3.13642045454543:
		isRotating = false
		emit_signal("col3")
	else:
		rotateMirror(delta)
		
func rotarCol4(delta):
	if currentRotation >= 5.4:
		isRotating = false
		emit_signal("col4")
	else:
		rotateMirror(delta)
		
func rotarCol5(delta):
	if currentRotation >= 2.53:
		isRotating = false
		emit_signal("col5")
	else:
		rotateMirror(delta)

func rotarCol6(delta):
	if currentRotation >= 2:
		isRotating = false
		emit_signal("col1")
	else:
		rotateMirror(delta)
