extends Node2D

var a =0
var mouse_position
var fire_rate = 5
var bullet_charger = 20

onready var escena_proyectil = preload("res://producto/assets/scenes/Proyectil.tscn")

func _mira_mouse(object):
	mouse_position = get_global_mouse_position()
	object.look_at(mouse_position)
		
func _dispara():
	var disparo = escena_proyectil.instance()
	disparo.direction = mouse_position - $Position_arma.global_position
	disparo.global_position = $Position_arma.global_position
	disparo.rotation_degrees = rotation_degrees
	get_tree().get_root().add_child(disparo)
	bullet_charger=bullet_charger-1

func _ready():
	pass 


func _process(_delta):
	_mira_mouse(self)
	
	if(rotation_degrees > 360):	rotation_degrees -=360
	elif(rotation_degrees < 0):	rotation_degrees += 360
		
	if  rotation_degrees > 270 or rotation_degrees <90 :
		scale.y = 1
	else:
		scale.y = -1
		
	if Input.is_action_pressed("shoot") and a % fire_rate==0 and bullet_charger>0: 
		_dispara()
	
	if Input.is_action_pressed("recharge"):
		bullet_charger=20
	 
	a+=1
