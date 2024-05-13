extends Control


var state = "blank"
var blank_color = "blank"
var blank2_color = "blank"
var blank3_color = "blank"
var blank4_color = "blank"
var blank_fraction: float
var blank2_fraction: float
var blank3_fraction: float
var blank4_fraction: float
var activated_blank = false
var activated_blank2 = false
var activated_blank3 = false
var activated_blank4 = false
var fraction_blue
var fraction_red
var fraction_green
var fraction_yellow


@onready var player_light = $player_light/PointLight2D
@onready var anim = $player_light/PointLight2D/AnimationPlayer
@onready var anim_blank = $blank_gems/blank_gem_button/blank_gem/AnimationPlayer
@onready var anim_blank2 = $blank_gems/blank_gem_button2/blank_gem2/AnimationPlayer
@onready var anim_blank3 = $blank_gems/blank_gem_button3/blank_gem3/AnimationPlayer
@onready var anim_blank4 = $blank_gems/blank_gem_button4/blank_gem4/AnimationPlayer

func _ready():
	fraction_blue = Global.decimals[Global.random[0]]
	fraction_red = Global.decimals[Global.random[1]]
	fraction_green = Global.decimals[Global.random[2]]
	fraction_yellow = Global.decimals[Global.random[3]]
	print(fraction_blue)
	print(fraction_red)
	print(fraction_green)
	print(fraction_yellow) 

func _process(delta):
	if(Input.is_action_just_pressed("Interact")):
		Global.change = "wall_puzzle-night"
		LoadManager.load_scene("res://Escenas/Luis/Rooms/night_room.tscn")
	if(Global.complete):
		await get_tree().create_timer(1.5).timeout
		Global.change = "wall_puzzle-night"
		LoadManager.load_scene("res://Escenas/Luis/Rooms/night_room.tscn")
		
		


func _on_blue_gem_pressed():
	if(state == "blank"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("color_blue")
			anim.advance(1 - anim_seconds)
			state = "blue"
		else:
			anim.play("color_blue")
			state = "blue"
			
	elif(state == "blue"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("uncolor_blue")
			anim.advance(1 - anim_seconds)
			state = "blank"
		else:
			anim.play("uncolor_blue")
			state = "blank"
			
	elif(state == "red"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("red_blue")
			anim.advance(1 - anim_seconds)
			state = "blue"
		else:
			anim.play("red_blue")
			state = "blue"
			
	elif(state == "green"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("green_blue")
			anim.advance(1 - anim_seconds)
			state = "blue"
		else:
			anim.play("green_blue")
			state = "blue"
			
	elif(state == "yellow"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("yellow_blue")
			anim.advance(1 - anim_seconds)
			state = "blue"
		else:
			anim.play("yellow_blue")
			state = "blue"

func _on_red_gem_pressed():
	if(state == "blank"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("color_red")
			anim.advance(1 - anim_seconds)
			state = "red"
		else:
			anim.play("color_red")
			state = "red"
			
	elif(state == "blue"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("blue_red")
			anim.advance(1 - anim_seconds)
			state = "red"
		else:
			anim.play("blue_red")
			state = "red"
			
	elif(state == "red"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("uncolor_red")
			anim.advance(1 - anim_seconds)
			state = "blank"
		else:
			anim.play("uncolor_red")
			state = "blank"
			
	elif(state == "green"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("green_red")
			anim.advance(1 - anim_seconds)
			state = "red"
		else:
			anim.play("green_red")
			state = "red"
		
	elif(state == "yellow"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("yellow_red")
			anim.advance(1 - anim_seconds)
			state = "red"
		else:
			anim.play("yellow_red")
			state = "red"
	
	
func _on_green_gem_pressed():
	if(state == "blank"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("color_green")
			anim.advance(1 - anim_seconds)
			state = "green"
		else:
			anim.play("color_green")
			state = "green"
			
	elif(state == "blue"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("blue_green")
			anim.advance(1 - anim_seconds)
			state = "green"
		else:
			anim.play("blue_green")
			state = "green"
			
	elif(state == "red"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("red_green")
			anim.advance(1 - anim_seconds)
			state = "green"
		else:
			anim.play("red_green")
			state = "green"
			
	elif(state == "green"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("uncolor_green")
			anim.advance(1 - anim_seconds)
			state = "blank"
		else:
			anim.play("uncolor_green")
			state = "blank"
			
	elif(state == "yellow"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("yellow_green")
			anim.advance(1 - anim_seconds)
			state = "green"
		else:
			anim.play("yellow_green")
			state = "green"

func _on_yellow_gem_pressed():
	if(state == "blank"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("color_yellow")
			anim.advance(1 - anim_seconds)
			state = "yellow"
		else:
			anim.play("color_yellow")
			state = "yellow"
			
	elif(state == "blue"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("blue_yellow")
			anim.advance(1 - anim_seconds)
			state = "yellow"
		else:
			anim.play("blue_yellow")
			state = "yellow"
			
	elif(state == "red"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("red_yellow")
			anim.advance(1 - anim_seconds)
			state = "yellow"
		else:
			anim.play("red_yellow")
			state = "yellow"
			
	elif(state == "green"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("green_yellow")
			anim.advance(1 - anim_seconds)
			state = "yellow"
		else:
			anim.play("green_yellow")
			state = "yellow"
			
	elif(state == "yellow"):
		if(anim.is_playing()):
			var anim_seconds = anim.get_current_animation_position()
			anim.play("uncolor_yellow")
			anim.advance(1 - anim_seconds)
			state = "blank"
		else:
			anim.play("uncolor_yellow")
			state = "blank"


func _on_button_pressed():
	if(activated_blank && activated_blank2 && activated_blank3 && activated_blank4 && !Global.complete):
		if(blank_fraction < blank2_fraction && blank2_fraction < blank3_fraction && blank3_fraction < blank4_fraction):
			$frontground/Button/icon/PointLight2D.visible = true
			$frontground/Button/icon/PointLight2D/AnimationPlayer.play("glow")
			Global.complete = true
		else:
			Global.pressed = true
			failed()
	else:
		Global.pressed = true
		failed()
	
func failed():
	if(state == "blue"):
		anim.play("uncolor_blue")
		state = "blank"
	elif(state == "red"):
		anim.play("uncolor_red")
		state = "blank"
	elif(state == "green"):
		anim.play("uncolor_green")
		state = "blank"
	elif(state == "yellow"):
		anim.play("uncolor_yellow")
		state = "blank"
	if(activated_blank):
		if(blank_color == "blue"):
			anim_blank.play("uncolor_blue")
			activated_blank = false
			blank_color = "blank"
		elif(blank_color == "red"):
			anim_blank.play("uncolor_red")
			activated_blank = false
			blank_color = "blank"
		elif(blank_color == "green"):
			anim_blank.play("uncolor_green")
			activated_blank = false
			blank_color = "blank"
		elif(blank_color == "yellow"):
			anim_blank.play("uncolor_yellow")
			activated_blank = false
			blank_color = "blank"
	if(activated_blank2):
		if(blank2_color == "blue"):
			anim_blank2.play("uncolor_blue")
			activated_blank2 = false
			blank2_color = "blank"
		elif(blank2_color == "red"):
			anim_blank2.play("uncolor_red")
			activated_blank2 = false
			blank2_color = "blank"
		elif(blank2_color == "green"):
			anim_blank2.play("uncolor_green")
			activated_blank2 = false
			blank2_color = "blank"
		elif(blank2_color == "yellow"):
			anim_blank2.play("uncolor_yellow")
			activated_blank2 = false
			blank2_color = "blank"
	if(activated_blank3):
		if(blank3_color == "blue"):
			anim_blank3.play("uncolor_blue")
			activated_blank3 = false
			blank3_color = "blank"
		elif(blank3_color == "red"):
			anim_blank3.play("uncolor_red")
			activated_blank3 = false
			blank3_color = "blank"
		elif(blank3_color == "green"):
			anim_blank3.play("uncolor_green")
			activated_blank3 = false
			blank3_color = "blank"
		elif(blank3_color == "yellow"):
			anim_blank3.play("uncolor_yellow")
			activated_blank3 = false
			blank3_color = "blank"
	if(activated_blank4):
		if(blank4_color == "blue"):
			anim_blank4.play("uncolor_blue")
			activated_blank4 = false
			blank4_color = "blank"
		elif(blank4_color == "red"):
			anim_blank4.play("uncolor_red")
			activated_blank4 = false
			blank4_color = "blank"
		elif(blank4_color == "green"):
			anim_blank4.play("uncolor_green")
			activated_blank4 = false
			blank4_color = "blank"
		elif(blank4_color == "yellow"):
			anim_blank4.play("uncolor_yellow")
			activated_blank4 = false
			blank4_color = "blank"


func _on_blank_gem_button_pressed():
		if(state == "blank" && activated_blank):
			if(blank_color == "blue"):
				anim_blank.play("uncolor_blue")
				activated_blank = false
				blank_color = "blank"
			elif(blank_color == "red"):
				anim_blank.play("uncolor_red")
				activated_blank = false
				blank_color = "blank"
			elif(blank_color == "green"):
				anim_blank.play("uncolor_green")
				activated_blank = false
				blank_color = "blank"
			elif(blank_color == "yellow"):
				anim_blank.play("uncolor_yellow")
				activated_blank = false
				blank_color = "blank"
		if(state == "blue" && !activated_blank):
			anim_blank.play("color_blue")
			blank_color = "blue"
			blank_fraction = float(fraction_blue)
			activated_blank = true
		if(state == "red" && !activated_blank):
			anim_blank.play("color_red")
			blank_color = "red"
			blank_fraction = float(fraction_red)
			activated_blank = true
		if(state == "green" && !activated_blank):
			anim_blank.play("color_green")
			blank_color = "green"
			blank_fraction = float(fraction_green)
			activated_blank = true
		if(state == "yellow" && !activated_blank):
			anim_blank.play("color_yellow")
			blank_color = "yellow"
			blank_fraction = float(fraction_yellow)
			activated_blank = true

func _on_blank_gem_button_2_pressed():
		if(state == "blank" && activated_blank2):
			if(blank2_color == "blue"):
				anim_blank2.play("uncolor_blue")
				activated_blank2 = false
				blank2_color = "blank"
			elif(blank2_color == "red"):
				anim_blank2.play("uncolor_red")
				activated_blank2 = false
				blank2_color = "blank"
			elif(blank2_color == "green"):
				anim_blank2.play("uncolor_green")
				activated_blank2 = false
				blank2_color = "blank"
			elif(blank2_color == "yellow"):
				anim_blank2.play("uncolor_yellow")
				activated_blank2 = false
				blank2_color = "blank"
		if(state == "blue" && !activated_blank2):
			anim_blank2.play("color_blue")
			blank2_color = "blue"
			blank2_fraction = float(fraction_blue)
			activated_blank2 = true
		if(state == "red" && !activated_blank2):
			anim_blank2.play("color_red")
			blank2_color = "red"
			blank2_fraction = float(fraction_red)
			activated_blank2 = true
		if(state == "green" && !activated_blank2):
			anim_blank2.play("color_green")
			blank2_color = "green"
			blank2_fraction = float(fraction_green)
			activated_blank2 = true
		if(state == "yellow" && !activated_blank2):
			anim_blank2.play("color_yellow")
			blank2_color = "yellow"
			blank2_fraction = float(fraction_yellow)
			activated_blank2 = true


func _on_blank_gem_button_3_pressed():
		if(state == "blank" && activated_blank3):
			if(blank3_color == "blue"):
				anim_blank3.play("uncolor_blue")
				activated_blank3 = false
				blank3_color = "blank"
			elif(blank3_color == "red"):
				anim_blank3.play("uncolor_red")
				activated_blank3 = false
				blank3_color = "blank"
			elif(blank3_color == "green"):
				anim_blank3.play("uncolor_green")
				activated_blank3 = false
				blank3_color = "blank"
			elif(blank3_color == "yellow"):
				anim_blank3.play("uncolor_yellow")
				activated_blank3 = false
				blank3_color = "blank"
		if(state == "blue" && !activated_blank3):
			anim_blank3.play("color_blue")
			blank3_color = "blue"
			blank3_fraction = float(fraction_blue)
			activated_blank3 = true
		if(state == "red" && !activated_blank3):
			anim_blank3.play("color_red")
			blank3_color = "red"
			blank3_fraction = float(fraction_red)
			activated_blank3 = true
		if(state == "green" && !activated_blank3):
			anim_blank3.play("color_green")
			blank3_color = "green"
			blank3_fraction = float(fraction_green)
			activated_blank3 = true
		if(state == "yellow" && !activated_blank3):
			anim_blank3.play("color_yellow")
			blank3_color = "yellow"
			blank3_fraction = float(fraction_yellow)
			activated_blank3 = true


func _on_blank_gem_button_4_pressed():
		if(state == "blank" && activated_blank4):
			if(blank4_color == "blue"):
				anim_blank4.play("uncolor_blue")
				activated_blank4 = false
				blank4_color = "blank"
			elif(blank4_color == "red"):
				anim_blank4.play("uncolor_red")
				activated_blank4 = false
				blank4_color = "blank"
			elif(blank4_color == "green"):
				anim_blank4.play("uncolor_green")
				activated_blank4 = false
				blank4_color = "blank"
			elif(blank4_color == "yellow"):
				anim_blank4.play("uncolor_yellow")
				activated_blank4 = false
				blank4_color = "blank"
		if(state == "blue" && !activated_blank4):
			anim_blank4.play("color_blue")
			activated_blank4 = true
			blank4_fraction = float(fraction_blue)
			blank4_color = "blue"
		if(state == "red" && !activated_blank4):
			anim_blank4.play("color_red")
			activated_blank4 = true
			blank4_fraction = float(fraction_red)
			blank4_color = "red"
		if(state == "green" && !activated_blank4):
			anim_blank4.play("color_green")
			activated_blank4 = true
			blank4_fraction = float(fraction_green)
			blank4_color = "green"
		if(state == "yellow" && !activated_blank4):
			anim_blank4.play("color_yellow")
			activated_blank4 = true
			blank4_fraction = float(fraction_yellow)
			blank4_color = "yellow"
