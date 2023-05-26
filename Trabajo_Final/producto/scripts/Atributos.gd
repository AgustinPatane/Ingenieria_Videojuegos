extends Node

var volumenes = {
	max_vol = 5,
	min_vol = -50,
	default_vol_sonido = 0,
	default_vol_musica = -50,
	sound_muted = false,
	music_muted = false
}

var opacidad_fondo = 0.8
var fullscreen = false
var tamanio = Vector2(700,400)
var posicion = Vector2(700,110)

var cursor_menu = load("res://producto/assets/img/Cursores/Cursor_Menu.png")
var cursor_juego = load("res://producto/assets/img/Cursores/Cursor_juego.png")

func set_cursor_menu():
	Input.set_custom_mouse_cursor(cursor_menu,0,Vector2(0,0))

func set_cursor_juego():
	Input.set_custom_mouse_cursor(cursor_juego,0,Vector2(15,15))

func set_config(config):
	fullscreen = config.fullscreen
	OS.set_window_fullscreen(fullscreen)
	volumenes.default_vol_sonido = config.vol_sonido
	volumenes.default_vol_musica = config.vol_musica
	volumenes.sound_muted = config.sound_muted
	volumenes.music_muted = config.music_muted
	SoundManager.actualiza_volumenes()


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
	curita = 5,
	juego = 300
}


var niveles_spawn = {
	demonio = 10,
	diablito = 1,
	gusano = 1,
	hechicero = 60,
	hongo = 1, # 3
	ojo = 1,
	pilar = 1
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

var evoluciones = {
	# EVOLUCION 1 : MOVIMIENTO / VELOCIDAD
	evolucion_1 = {
	"nombre": "movimiento",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1.5,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "amarillo"
	},

	evolucion_1_1 = {
	"nombre": "movimiento_propio",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1.3,
	"damage": 1,
	"rango": 1.5,
	"arma": "ak-47",
	"skin_accesorio" : "0"
	},
	
	evolucion_1_1_2 = {
	"nombre": "movimiento_propio_atravesarmuros",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1.3,
	"arma": "ak-47",
	"skin_accesorio" : "0"
	},
	
	evolucion_1_1_1 = {
	"nombre": "movimiento_propio_nitro",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1.1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "0"
	},
	
	evolucion_1_2 = {
	"nombre": "movimiento_enemigos",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47"
	},
	
	evolucion_1_2_1 = {
	"nombre": "movimiento_enemigos_ondaralentizadora",
	"cadencia": 1,
	"vida": 0.7,
	"velocidad": 1.2,
	"damage": 1,
	"rango": 0.8,
	"arma": "ak-47"
	},
	
	evolucion_1_2_2 = {
	"nombre": "movimiento_enemigos_congelacion",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47"
	},

# EVOLUCION 2 : SALUD / VIDA

	evolucion_2 = {
	"nombre": "salud",
	"cadencia": 1,
	"vida": 2,
	"velocidad": 0.9,
	"damage": 1,
	"rango": 1,
	"arma": "rifle",
	"skin_accesorio" : "verde"
	},

	evolucion_2_1 = {
	"nombre": "salud_masvida",
	"cadencia": 1,
	"vida": 2,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
	},

	evolucion_2_1_1 = {
	"nombre": "salud_masvida_tokenvidaextra",
	"cadencia": 1,
	"vida": 1.2,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
	},

	evolucion_2_1_2 = {
	"nombre": "salud_masvida_regeneracion",
	"cadencia": 1,
	"vida": 1.2,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
	},

	evolucion_2_2 = {
	"nombre": "salud_masinmune",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
	},

	evolucion_2_2_1 = {
	"nombre": "salud_masinmune_escudo",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
	},

	evolucion_2_2_2 = {
	"nombre": "salud_masinmune_resiliente",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
	},

# EVOLUCION 3 : ATAQUE

	evolucion_3 = {
	"nombre": "ataque",
	"cadencia": 0.75,
	"vida": 1.5,
	"velocidad": 0.75,
	"damage": 1.5,
	"rango": 1.5,
	"arma": "rifle",
	"skin_accesorio" : "rojo"
	},

	evolucion_3_1 = {
	"nombre": "ataque_cerca",
	"cadencia": 1,
	"vida": 3,
	"velocidad": 0.75,
	"damage": 1,
	"rango": 2,
	"arma": "escopeta"
	},

	evolucion_3_1_1 = {
	"nombre": "ataque_cerca_areaexplosiva",
	"cadencia": 1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 1.5,
	"rango": 0.75,
	"arma": "escopeta"
	},

	evolucion_3_1_2 = {
	"nombre": "ataque_cerca_penetramuros",
	"cadencia": 1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
	},

	evolucion_3_2 = {
	"nombre": "ataque_oneshoot",
	"cadencia": 0.75,
	"vida": 1.5,
	"velocidad": 0.75,
	"damage": 2,
	"rango": 3,
	"arma": "francotirador"
	},

	evolucion_3_2_1 = {
	"nombre": "ataque_oneshoot_francotirador",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1.5,
	"rango": 1,
	"arma": "francotirador"
	},

	evolucion_3_2_2 = {
	"nombre": "ataque_oneshoot_bazooka",
	"cadencia": 0.5,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 2,
	"rango": 1,
	"arma": "bazooka"
	},


# EVOLUCION 4 : TIRO / DISPARO / CADENCIA

	evolucion_4 = {
	"nombre": "tiro",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ametralladora",
	"skin_accesorio" : "azul"
	},

	evolucion_4_1 = {
	"nombre": "tiro_dispersion",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ametralladora"
	},

	evolucion_4_1_1 = {
	"nombre": "tiro_dispersion_rebote",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 4,
	"rango": 1,
	"arma": "ametralladora"
	},

	evolucion_4_1_2 = {
	"nombre": "tiro_dispersion_360",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 2,
	"rango": 3,
	"arma": "ametralladora"
	},

	evolucion_4_2 = {
	"nombre": "tiro_cadencia",
	"cadencia": 1.1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 2,
	"rango": 3,
	"arma": "ametralladora"
	},

	evolucion_4_2_1 = {
	"nombre": "tiro_cadencia_doblearma",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 3,
	"rango": 1.5,
	"arma": "ak-47"
	},

	evolucion_4_2_2 = {
	"nombre": "tiro_cadencia_infinita",
	"cadencia": 4,
	"vida": 1,
	"velocidad": 1,
	"damage": 0.2,
	"rango": 1,
	"arma": "ametralladora"
	}
}

# 1 DANIO
# 2 VIDA
# 3 VELOCIDAD
# 4 CADENCIA
var evol_mapa_luna = {
	evol_1 = "1",
	evol_2 = "2"	
}

func get_pilar():
	return pilar
