extends KinematicBody2D

var motion = Vector2()
var vel_walk = 20000
var vel_run = 35000
var SPEED = 0
var puntos = 0
var vida = 100

func _movimiento(delta):
	motion = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
		get_node("Jugador_Sprite").set_flip_h(false)
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
		get_node("Jugador_Sprite").set_flip_h(true)
	if Input.is_action_pressed("ui_up"):
		motion.y = -100
	elif Input.is_action_pressed("ui_down"):
		motion.y = 100
		
	motion = motion.normalized()
	
	if Input.is_action_pressed("run"): SPEED = vel_run
	else: SPEED = vel_walk
		
	motion = move_and_slide(motion*delta*SPEED)

func _ready():
	pass 

func _process(delta):
	_movimiento(delta)

func suma_puntos(cantidad):
	puntos += cantidad

func recibe_ataque(danio):
	vida-=danio
