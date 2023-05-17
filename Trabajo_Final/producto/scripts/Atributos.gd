extends Node

var volumenes = {
	max_vol = 5,
	min_vol = -50,
	default_vol_sonido = 0,
	default_vol_musica = 0,
	sound_muted = false,
	music_muted = false
}

var fullscreen = false

# JUGADOR ------------------------------------------------------------

var jugador = {
	vida_max = 100, 
	exp_necesaria = 1,
	cadencia_disparo = 0.4,
	danio = 10,
	rango = 0.5,
	speed = 20000,
	speed_proyectil = 800,
	cant_atraviesa = 1,
	cant_proyectiles = 1,
	niveles_evol = [2,3,4]
}

func get_atrib_jugador():
	return jugador

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

var niveles_spawn = {
	demonio = 10,
	diablito = 1,
	gusano = 1,
	hechicero = 6,
	hongo = 1, # 3
	ojo = 2,
	pilar = 4
}

func get_tiempos():
	return tiempos

func get_niveles_spawn():
	return niveles_spawn

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
	danio = 0.2,
	experiencia = 5,
	puntos_muerte = 7,
	speed = 0,
	max_tamanio = 1
}

func get_hongo():
	return hongo

# OJO ------------------------------------------------------------

var ojo = {
	vida = 20,
	danio = 15,
	experiencia = 2,
	puntos_muerte = 5,
	speed = 75,
	cadencia_disparo = 4
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
