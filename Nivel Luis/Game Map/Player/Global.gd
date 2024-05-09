extends Node2D

var change = ""
var activated = false
var dead = false
var pressed = false
var complete = false
var chest_puzzle_complete = false
var random

@export var decimals = [0.6,1.125,0.5,0.1,3.5,1.3,2.5,1.6,1.2]
@export var fractions = ["3/5","9/8","2/4","1/9","7/2","4/3","5/2","8/5","6/5"]

func _ready():
	random = get_random_numbers(0,9)


func get_random_numbers(from, to):
	var arr = []
	for i in range(from,to):
		arr.append(i)
	arr.shuffle()
	return arr
