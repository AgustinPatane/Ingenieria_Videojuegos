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

var cursor_normal
var cursor_apretado

func set_cursor_menu():
	cursor_normal = load("res://producto/assets/img/Cursores/Cursor_Menu.png")
	cursor_apretado = load("res://producto/assets/img/Cursores/Cursor_Menu_apretado.png")
	Input.set_custom_mouse_cursor(cursor_normal,0,Vector2(0,0))

func set_cursor_juego():
	cursor_normal = load("res://producto/assets/img/Cursores/Cursor_juego.png")
	cursor_apretado = load("res://producto/assets/img/Cursores/Cursor_juego_apretado.png")
	Input.set_custom_mouse_cursor(cursor_normal,0,Vector2(15,15))

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			Input.set_custom_mouse_cursor(cursor_apretado)
		else:
			Input.set_custom_mouse_cursor(cursor_normal)


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
	gusano = 1,
	hechicero = 30,
	hongo = 8,
	ojo = 5,
	pilar = 20,
	curita = 5,
	reloj = 1,
	juego = 300,
	evol = 1.5
}

var niveles_spawn = {
	demonio = 10,
	diablito = 5,
	gusano = 1,
	hechicero = 6,
	hongo = 3, # 3
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
	puntos_muerte = 200,
	speed = 100,
	cantidad = 4
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
	
# EVOLUCIONES -------------------------------------------------------
var evoluciones = {
	# EVOLUCION 1 : MOVIMIENTO / VELOCIDAD
	evolucion_1 = {
		"nombre": "movimiento",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1.3,
		"damage": 1,
		"rango": 1,
		"arma": "ak-47",
		"skin_accesorio" : "azul",
		"titulo": "MAX AGIL",
		"historia": "Has acabado con muchos monstruos, quienes te han inculcado en tu ADN un gen con el que aprenderas a controlar el movimiento de los seres vivos",
		"habilidad": "+ VELOCIDAD",
		"gorro" : ""
	},

	evolucion_1_1 = {
		"nombre": "movimiento_propio",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1.5,
		"damage": 1,
		"rango": 1,
		"arma": "ak-47",
		"skin_accesorio" : "azul",
		"titulo": "MAX EL VELOCISTA",
		"historia": "uego de tanto desplazamiento luchando contra los monstruos, has aprendido a moverte mejor.",
		"habilidad": "+ VELOCIDAD",
		"gorro" : "200"
	},
	evolucion_1_1_2 = {
		"nombre": "movimiento_propio_atravesarmuros",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "ak-47",
		"skin_accesorio" : "azul",
		"titulo": "FANTASMAX",
		"historia": "Luego de haber aprendido a manejar tu velocidad, has saltado a otro nivel: ahora puedes pasar por encima de lo que quieras, como un fantasma.",
		"habilidad": "ATRAVIESAS OBSTACULOS",
		"gorro" : "301"
	},
	evolucion_1_1_1 = {
		"nombre": "movimiento_propio_nitro",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "ak-47",
		"skin_accesorio" : "azul",
		"titulo": "NITROMAX",
		"historia": "Obtienes el poder de tener una super velocidad temporal cuando lo desees cada cierto tiempo.",
		"habilidad": "PODER DE SUPER VELOCIDAD",
		"gorro" : "300"
	},
	evolucion_1_2 = {
		"nombre": "movimiento_enemigos",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "ak-47",
		"skin_accesorio" : "azul",
		"titulo": "EL RALENTIZADOR MAX",
		"historia": "Has afectado el terreno de movimiento, ahora logras que tus enemigos se muevan con menos velocidad.",
		"habilidad": "ENEMIGOS MAS LENTOS",
		"gorro" : "210"
	},
	evolucion_1_2_1 = {
		"nombre": "movimiento_enemigos_ondaralentizadora",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "ak-47",
		"skin_accesorio" : "azul",
		"titulo": "EL AURA RALENTIZADORA",
		"historia": "Has comenzado a generar moleculas que provocan que tus enemigos al acercarte a ti se muevan mucho mas lento",
		"habilidad": "RADIO DE RALENTIZACION",
		"gorro" : "310"
	},
	evolucion_1_2_2 = {
		"nombre": "movimiento_enemigos_congelacion",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "ak-47",
		"skin_accesorio" : "azul",
		"titulo": "EL CONGELADOR MAX",
		"historia": "Obtienes el pdoer de congelar temporalmente a tus enemigos cada cierto tiempo.",
		"habilidad": "PODER DE CONGELAMIENTO",
		"gorro" : "311"
	},

	# EVOLUCION 2 : SALUD / VIDA

	evolucion_2 = {
		"nombre": "salud",
		"cadencia": 1,
		"vida": 2,
		"velocidad": 0.8,
		"damage": 1,
		"rango": 1,
		"arma": "rifle",
		"skin_accesorio" : "verde",
		"titulo": "EL COLOSO",
		"historia": "Has aguantado y sobrevivido de muchos seres peligrosos, aumentas tu resistencia a ataques.",
		"habilidad": "+ VIDA",
		"gorro" : ""
	},

	evolucion_2_1 = {
		"nombre": "salud_masvida",
		"cadencia": 1,
		"vida": 2.5,
		"velocidad": 0.9,
		"damage": 1,
		"rango": 1,
		"arma": "escopeta",
		"skin_accesorio" : "verde",
		"titulo": "EL TANQUE MAX",
		"historia": "Has pasado por una mutacion en tu ADN genetico que provoca que tengas muchas mas vida.",
		"habilidad": "++ VIDA",
		"gorro" : "220"
	},

	evolucion_2_1_1 = {
		"nombre": "salud_masvida_tokenvidaextra",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "escopeta",
		"skin_accesorio" : "verde",
		"titulo": "MAXUSCRISTO",
		"historia": "Un milagro ocurrira si mueres, probablemente logres un unica resurrecciona, aprovechala.",
		"habilidad": "VIDA EXTRA",
		"gorro" : "320"
	},

	evolucion_2_1_2 = {
		"nombre": "salud_masvida_regeneracion",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "escopeta",
		"skin_accesorio" : "verde",
		"titulo": "MAX REGENERATIVO",
		"historia": "Han mutado todos tus sistemas, ahora logras regenrar tu vida cada cierto tiempo.",
		"habilidad": "REGENERACION DE VIDA",
		"gorro" : "321"
	},

	evolucion_2_2 = {
		"nombre": "salud_masinmune",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "escopeta",
		"skin_accesorio" : "verde",
		"titulo": "LA ROCA MAX",
		"historia": "Has mutado con tu resistencia, ahora tienes mucho mas aguante a los ataques enemigos.",
		"habilidad": "+ RESISTENCIA",
		"gorro" : "230"
	},

	evolucion_2_2_1 = {
		"nombre": "salud_masinmune_escudo",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "escopeta",
		"skin_accesorio" : "verde",
		"titulo": "MAX INMUNE",
		"historia": "Obtienes el poder de ser inmune temporalmente cada cierto tiempo.",
		"habilidad": "PODER DE ESCUDO",
		"gorro" : "330"
	},

	evolucion_2_2_2 = {
		"nombre": "salud_masinmune_resiliente",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "escopeta",
		"skin_accesorio" : "verde",
		"titulo": "LA RESISTENCIA",
		"historia": "Cuando te queda poca vida, los ataques enemigos te afectan menos.",
		"habilidad": "+ RESISTENCIA",
		"gorro" : "331"
	},

	# EVOLUCION 3 : ATAQUE

	evolucion_3 = {
		"nombre": "ataque",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1.5,
		"rango": 1,
		"arma": "escopeta",
		"skin_accesorio" : "rojo",
		"titulo": "FORZAMAX",
		"historia": "Incrementas tu fuerza, cada impacto que reciben tus enemigos es mas efectivo.",
		"habilidad": "+ FUERZA",
		"gorro" : ""
	},

	evolucion_3_1 = {
		"nombre": "ataque_cerca",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 2,
		"rango": 0.8,
		"arma": "rifle",
		"skin_accesorio" : "rojo",
		"titulo": "SMART MAX",
		"historia": "Aprendes a provocar ataques criticos a poca distnacia.",
		"habilidad": "+ ATAQUE EN - RANGO",
		"gorro" : "240"
	},

	evolucion_3_1_1 = {
		"nombre": "ataque_cerca_areaexplosiva",
		"cadencia": 1,
		"vida": 1.5,
		"velocidad": 1,
		"damage": 1.5,
		"rango": 0.75,
		"arma": "bazooka",
		"skin_accesorio" : "rojo",
		"titulo": "MAX DA BOMB",
		"historia": "Has aprendido a fabricar bombas, ahora, queda en ti saber usarlas.",
		"habilidad": "PODER DE RADIO EXPLOSIVO",
		"gorro" : "340"
	},

	evolucion_3_1_2 = {
		"nombre": "ataque_cerca_balasxxl",
		"cadencia": 20,
		"vida": 1,
		"velocidad": 1,
		"damage": 0.1,
		"rango": 1.5,
		"arma": "arma_xxl",
		"skin_accesorio" : "rojo",
		"titulo": "MAX BALOTAS",
		"historia": "Consigues un arma que dispara BALAS GIGANTES.",
		"habilidad": "BALAS ENORMES",
		"gorro" : "341"
	},

	evolucion_3_2 = {
		"nombre": "ataque_oneshoot",
		"cadencia": 0.7,
		"vida": 1,
		"velocidad": 0.9,
		"damage": 2,
		"rango": 5,
		"arma": "rifle",
		"skin_accesorio" : "rojo",
		"titulo": "OJO DE AGUILA",
		"historia": "Involucras todas tus fuerzas en tus disparos, provocas impactos letales.",
		"habilidad": "+ ATAQUE EN + RANGO",
		"gorro" : "250"
	},

	evolucion_3_2_1 = {
		"nombre": "ataque_oneshoot_francotirador",
		"cadencia": 0.8,
		"vida": 1,
		"velocidad": 1,
		"damage": 3,
		"rango": 3,
		"arma": "francotirador",
		"skin_accesorio" : "rojo",
		"titulo": "EL FRANCOTIRADOR",
		"historia": "Has aprendido a usar un francotirador, prueba que tan letal es.",
		"habilidad": "ATAQUE LETAL",
		"gorro" : "350"
	},

	evolucion_3_2_2 = {
		"nombre": "ataque_oneshoot_bazooka",
		"cadencia": 0.5,
		"vida": 1.5,
		"velocidad": 1,
		"damage": 2,
		"rango": 1,
		"arma": "bazooka",
		"skin_accesorio" : "rojo",
		"titulo": "MAXOOKA",
		"historia": "Boom.",
		"habilidad": "ATAQUES EXPLOSIVOS",
		"gorro" : "351"
	},


	# EVOLUCION 4 : TIRO / DISPARO / CADENCIA

	evolucion_4 = {
		"nombre": "tiro",
		"cadencia": 1.2,
		"vida": 1,
		"velocidad": 1,
		"damage": 1.2,
		"rango": 1.3,
		"arma": "ametralladora",
		"skin_accesorio" : "amarillo",
		"titulo": "EXPERTO EN ARMAS",
		"historia": "Empiezas tu camino en aprender el uso de armas, mejorar los rangos de disparo y la cantidad",
		"habilidad": "+ CADENCIA + RANGO",
		"gorro" : ""
	},

	evolucion_4_1 = {
		"nombre": "tiro_dispersion",
		"cadencia": 1.2,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 2,
		"arma": "ametralladora",
		"skin_accesorio" : "amarillo",
		"titulo": "LA LLUVIA DE PLOMO",
		"historia": "Controlas tus disapros y aprendes a disparar mas de una bala a la vez gracias a tu nueva ametralladora.",
		"habilidad": "DISPERSION DE DISPAROS",
		"gorro" : "260"
	},

	evolucion_4_1_1 = {
		"nombre": "tiro_dispersion_rebote",
		"cadencia": 1.2,
		"vida": 1,
		"velocidad": 1,
		"damage": 0.4,
		"rango": 1,
		"arma": "ametralladora",
		"skin_accesorio" : "amarillo",
		"titulo": "REBOTES MORTALES",
		"historia": "Modificas tus balas con el objetivo de que estas reboten entre enemigos. Puede ser letal para ellos.",
		"habilidad": "REBOTE DE BALAS",
		"gorro" : "360"
	},

	evolucion_4_1_2 = {
		"nombre": "tiro_dispersion_360",
		"cadencia": 1.5,
		"vida": 1,
		"velocidad": 1,
		"damage": 0.3,
		"rango": 2,
		"arma": "ametralladora",
		"skin_accesorio" : "amarillo",
		"titulo": "FUEGOS ARTIFICALES",
		"historia": "Has llegado a un nivel tan alto de manejo del arma que puedes disparar a todo tu alrededor.",
		"habilidad": "DISPARO EN 360 GRADOS",
		"gorro" : "361"
	},

	evolucion_4_2 = {
		"nombre": "tiro_cadencia",
		"cadencia": 1.5,
		"vida": 1,
		"velocidad": 1,
		"damage": 1,
		"rango": 1,
		"arma": "ametralladora",
		"skin_accesorio" : "amarillo",
		"titulo": "EL TREN DE PLOMO",
		"historia": "Aprendes a realizar un disparo aturdidor con muchas balas a la vez.",
		"habilidad": "+ CADENCIA",
		"gorro" : "370"
	},

	evolucion_4_2_1 = {
		"nombre": "tiro_cadencia_doblearma",
		"cadencia": 1,
		"vida": 1,
		"velocidad": 1,
		"damage": 1.5,
		"rango": 1.5,
		"arma": "ak-47",
		"skin_accesorio" : "amarillo",
		"titulo": "DOBLE PESADILLA",
		"historia": "Obtienes una nueva arma gracias a tu habilidad de saber como fabricarlas.",
		"habilidad": "DOBLE ARMA",
		"gorro" : "370"
	},

	evolucion_4_2_2 = {
		"nombre": "tiro_cadencia_infinita",
		"cadencia": 2,
		"vida": 1,
		"velocidad": 1,
		"damage": 0.8,
		"rango": 1,
		"arma": "ametralladora",
		"skin_accesorio" : "amarillo",
		"titulo": "RAFAGA DE PLOMO",
		"historia": "Hacen falta tantas balas?",
		"habilidad": "PODER DE CADENCIA INFINITA",
		"gorro" : "371"
	}
}

# 1 VELOCIDAD
# 2 VIDA
# 3 DANIO
# 4 CADENCIA

#var mapas = ["MapaArena","MapaLuna","MapaLava","MapaMadera","MapaArcilla","MapaDungeon"]
var evol_MapaArena = {
	evol_1 = "1", 
	evol_2 = "2" 
}

var evol_MapaLuna = {
	evol_1 = "3", 
	evol_2 = "4"
}

var evol_MapaLava = {
	evol_1 = "1", 
	evol_2 = "4" 
}

var evol_MapaMadera = {
	evol_1 = "2", 
	evol_2 = "3"
}

var evol_MapaArcilla = {
	evol_1 = "1", 
	evol_2 = "3" 
}

var evol_MapaDungeon = {
	evol_1 = "2", 
	evol_2 = "4" 
}

var evol_MapaIsla = {
	evol_1 = "3", 
	evol_2 = "4" 
}
