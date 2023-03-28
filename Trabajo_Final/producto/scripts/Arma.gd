extends Node2D

var a =0
var mouse_position
var fire_rate = 20

onready var escena_proyectil = preload("res://producto/assets/other/Proyectil.tscn")

func _mira_mouse(object):
	mouse_position = get_global_mouse_position()
	object.look_at(mouse_position)
		
func _dispara():
	var disparo = escena_proyectil.instance()
	disparo.direction = mouse_position - $Position2D2.global_position
	disparo.global_position = $Position2D2.global_position
	disparo.rotation_degrees = rotation_degrees
	get_tree().get_root().add_child(disparo)

func _ready():
	pass 


func _process(delta):
	_mira_mouse(self)
	
	if(rotation_degrees > 360):	rotation_degrees -=360
	elif(rotation_degrees < 0):	rotation_degrees += 360
		
	if  rotation_degrees > 270 or rotation_degrees <90 :
		get_node("Arma_Sprite").set_flip_v(false)
	else:
		get_node("Arma_Sprite").set_flip_v(true)
		
	if Input.is_action_pressed("shoot") and a % fire_rate==0: 
		_dispara()
	a+=1
