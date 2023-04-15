extends Node2D

var mouse_position
var cadencia_disparo = 0.5 #es en segundos
var tiempo_ultimo_disparo = 0.0
var damage_Arma = 10.0

onready var escena_proyectil = preload("res://producto/assets/scenes/Proyectil.tscn")

func get_damage_Arma():
	return damage_Arma 

func actualiza_damage(value):
	damage_Arma += value

func get_cadencia_disparo():
	return cadencia_disparo

func actualiza_cadencia(value):
	cadencia_disparo += value

func _mira_mouse(object):
	mouse_position = get_global_mouse_position()
	object.look_at(mouse_position)
		
func _dispara():
	var disparo = escena_proyectil.instance()
	#$disparo.play()
	disparo.direction = mouse_position - $Position_arma.global_position
	disparo.global_position = $Position_arma.global_position
	disparo.rotation_degrees = rotation_degrees
	disparo.set_damage(damage_Arma)
	get_tree().get_root().add_child(disparo)
	tiempo_ultimo_disparo = OS.get_ticks_msec() / 1000.0

func _ready():
	pass
	
func _process(_delta):
	var cond_disparo = tiempo_ultimo_disparo + cadencia_disparo <= OS.get_ticks_msec() / 1000.0
	if Input.is_action_pressed("shoot") and cond_disparo: 
		_dispara()

func _physics_process(_delta):
	_mira_mouse(self)
	if(rotation_degrees > 360):	rotation_degrees -=360
	elif(rotation_degrees < 0):	rotation_degrees += 360
		
	if  rotation_degrees > 270 or rotation_degrees <90 :
		$Arma_Sprite.set_flip_v(false)
		get_parent().get_node("Jugador_Sprite").set_flip_h(false)
		self.position.y = -2
	else:
		$Arma_Sprite.set_flip_v(true)
		get_parent().get_node("Jugador_Sprite").set_flip_h(true)
