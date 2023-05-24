extends "res://producto/scripts/Enemigo.gd"

onready var atributos = preload("res://producto/scripts/Atributos.gd")
onready var escena_proyectil = preload("res://producto/assets/scenes/MunicionEnemigo.tscn")

var tiempo_ultimo_disparo=0.0
var cadencia_disparo

func _dispara():
	var disparo = escena_proyectil.instance()
	#$disparo.play()
	disparo.direction = self.pos_jugador - $Position_arma.global_position
	disparo.global_position = $Position_arma.global_position
	disparo.rotation_degrees = disparo.direction.angle() * 180 / 3.141592
	disparo.set_damage(self.danio)
	disparo.set_rango(4)
	disparo.set_speed(300)
	get_node("/root/"+Engine.get_meta("nombre_escena_mapa")).add_child(disparo)
	tiempo_ultimo_disparo = OS.get_ticks_msec() / 1000.0

func _ready():
	var atrib = Atributos.get_ojo()
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)
	cadencia_disparo = atrib.cadencia_disparo

func ataque():
	pass
	#var cond_disparo = tiempo_ultimo_disparo + cadencia_disparo <= OS.get_ticks_msec() / 1000.0
	#if cond_disparo: 
	#	_dispara()

func _process(delta):
	var cond_disparo = tiempo_ultimo_disparo + cadencia_disparo <= OS.get_ticks_msec() / 1000.0
	if cond_disparo: 
		_dispara()
	

