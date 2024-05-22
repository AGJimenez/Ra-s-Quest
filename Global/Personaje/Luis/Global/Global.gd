extends Node2D


#dialog
var dialogue_state = false

#loading_screen
var change = ""

#intro
var tutorial_on = false
var controls_wasd = false
var controls_e = false
var controls_add = false

#nivel_mario
var first_cursed_gem = false

#nivel_dani_final
var second_cursed_gem = false



#chest_room
var chest_puzzle_complete = false
var gain_torch_end = false
var not_prepared = true

#night_room
var door_disable = false
var anubis_dialog_end = false
var pressed = false
var complete = false


#flower
var flower = "blank"
var random

var blue_fraction
var red_fraction
var green_fraction
var yellow_fraction

var blue_flower_dialog = false
var red_flower_dialog = false
var green_flower_dialog = false
var yellow_flower_dialog = false

#torch_room
var activated = false
var dead = false

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
