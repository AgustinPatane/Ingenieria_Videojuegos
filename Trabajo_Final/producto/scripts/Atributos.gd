extends Node

# JUGADOR ------------------------------------------------------------

var jugador_exp_necesaria = 10
var jugador_cadencia = 0.4 #es en segundos
var jugador_damage_Arma = 10.0
var jugador_rango = 0.5 #tiempo de vida del disparo
var jugador_velocidad_proyectil = 800

# MAPA ---------------------------------------------------------------

var max_enemigos = 30

var tiempos = {
	demonio = 60,
	diablito = 10,
	gusano = 2,
	hechicero = 30,
	hongo = 8,
	ojo = 5,
	pilar = 20,
	curita = 5
}

func get_tiempos():
	return tiempos

# DEMONIO ------------------------------------------------------------

var demonio = {
	vida = 2000,
	danio = 50,
	experiencia = 50,
	puntos_muerte = 50,
	speed = 100
}

func get_demonio():
	return demonio
	
# DIABLITO ------------------------------------------------------------

var diablito = {
	vida = 40,
	danio = 25,
	experiencia = 10,
	puntos_muerte = 20,
	speed = 200
}

func get_diablito():
	return diablito

# GUSANO ------------------------------------------------------------

var gusano = {
	vida = 20,
	danio = 10,
	experiencia = 1,
	puntos_muerte = 2,
	speed = 100
}

func get_gusano():
	return gusano

# HECHICERO ------------------------------------------------------------

var hechicero = {
	vida = 200,
	danio = 20,
	experiencia = 50,
	puntos_muerte = 50,
	speed = 100
}

func get_hechicero():
	return hechicero

# HONGO ------------------------------------------------------------

var hongo = {
	vida = 30,
	danio = 10,
	experiencia = 15,
	puntos_muerte = 50,
	speed = 0
}

func get_hongo():
	return hongo

# OJO ------------------------------------------------------------

var ojo = {
	vida = 20,
	danio = 15,
	experiencia = 2,
	puntos_muerte = 5,
	speed = 50
}

func get_ojo():
	return ojo

# PILAR ------------------------------------------------------------

var pilar = {
	vida = 500,
	danio = 10,
	experiencia = 20,
	puntos_muerte = 40,
	speed = 10
}

func get_pilar():
	return pilar
