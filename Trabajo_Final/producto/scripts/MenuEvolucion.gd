extends CanvasLayer

onready var btn_seleccionar = get_node("Seleccionar")
onready var ventana = get_node("Ventana")
onready var sprite_jugador = get_node("Ventana/Jugador")
onready var sprite_arma = get_node("Ventana/Jugador/Arma")
onready var sprite_bandera = get_node("Ventana/Jugador/Bandera")
onready var sprite_gorro = get_node("Ventana/Jugador/Gorro")
onready var animacion = get_node("Ventana/Animacion")
onready var titulo = get_node("Ventana/Titulo")
onready var historia = get_node("Ventana/Historia")
onready var habilidad = get_node("Ventana/Habilidad")


#_________________BOTONES ARBOL DE EVOLUCION_________________
onready var boton_evolucion = get_node("evolucion")


onready var boton_evolucion_1 = get_node("evolucion/evolucion_1")

onready var boton_evolucion_1_1 = get_node("evolucion/evolucion_1/evolucion_1_1")
onready var boton_evolucion_1_1_1 = get_node("evolucion/evolucion_1/evolucion_1_1/evolucion_1_1_1")
onready var boton_evolucion_1_1_2 = get_node("evolucion/evolucion_1/evolucion_1_1/evolucion_1_1_2")

onready var boton_evolucion_1_2 = get_node("evolucion/evolucion_1/evolucion_1_2")
onready var boton_evolucion_1_2_1 = get_node("evolucion/evolucion_1/evolucion_1_2/evolucion_1_2_1")
onready var boton_evolucion_1_2_2 = get_node("evolucion/evolucion_1/evolucion_1_2/evolucion_1_2_2")


onready var boton_evolucion_2 = get_node("evolucion/evolucion_2")

onready var boton_evolucion_2_1 = get_node("evolucion/evolucion_2/evolucion_2_1")
onready var boton_evolucion_2_1_1 = get_node("evolucion/evolucion_2/evolucion_2_1/evolucion_2_1_1")
onready var boton_evolucion_2_1_2 = get_node("evolucion/evolucion_2/evolucion_2_1/evolucion_2_1_2")

onready var boton_evolucion_2_2 = get_node("evolucion/evolucion_2/evolucion_2_2")
onready var boton_evolucion_2_2_1 = get_node("evolucion/evolucion_2/evolucion_2_2/evolucion_2_2_1")
onready var boton_evolucion_2_2_2 = get_node("evolucion/evolucion_2/evolucion_2_2/evolucion_2_2_2")

onready var _1 = get_node("evolucion/Contenedor_Ramas/_1")
onready var _1_1 = get_node("evolucion/Contenedor_Ramas/_1_1")
onready var _1_2 = get_node("evolucion/Contenedor_Ramas/_1_2")
onready var _1_1_1 = get_node("evolucion/Contenedor_Ramas/_1_1_1")
onready var _1_1_2 = get_node("evolucion/Contenedor_Ramas/_1_1_2")
onready var _1_2_1 = get_node("evolucion/Contenedor_Ramas/_1_2_1")
onready var _1_2_2 = get_node("evolucion/Contenedor_Ramas/_1_2_2")

onready var _2 = get_node("evolucion/Contenedor_Ramas/_2")
onready var _2_1 = get_node("evolucion/Contenedor_Ramas/_2_1")
onready var _2_1_1 = get_node("evolucion/Contenedor_Ramas/_2_1_1")
onready var _2_1_2 = get_node("evolucion/Contenedor_Ramas/_2_1_2")
onready var _2_2 = get_node("evolucion/Contenedor_Ramas/_2_2")
onready var _2_2_1 = get_node("evolucion/Contenedor_Ramas/_2_2_1")
onready var _2_2_2 = get_node("evolucion/Contenedor_Ramas/_2_2_2")

# EVOLUCION 1 : MOVIMIENTO / VELOCIDAD
var evolucion_1 = {
	"nombre": "movimiento",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1.3,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "azul"
}
var evolucion_1_1 = {
	"nombre": "movimiento_propio",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1.5,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "00"
}
var evolucion_1_1_2 = {
	"nombre": "movimiento_propio_atravesarmuros",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "10"
}
var evolucion_1_1_1 = {
	"nombre": "movimiento_propio_nitro",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "20"
}
var evolucion_1_2 = {
	"nombre": "movimiento_enemigos",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "01"
}
var evolucion_1_2_1 = {
	"nombre": "movimiento_enemigos_ondaralentizadora",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "11"
}
var evolucion_1_2_2 = {
	"nombre": "movimiento_enemigos_congelacion",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47",
	"skin_accesorio" : "21"
}
# EVOLUCION 2 : SALUD / VIDA
var evolucion_2 = {
	"nombre": "salud",
	"cadencia": 1,
	"vida": 2,
	"velocidad": 0.8,
	"damage": 1,
	"rango": 1,
	"arma": "rifle",
	"skin_accesorio" : "verde"
}
var evolucion_2_1 = {
	"nombre": "salud_masvida",
	"cadencia": 1,
	"vida": 2.5,
	"velocidad": 0.9,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta",
	"skin_accesorio" : "02"
}
var evolucion_2_1_1 = {
	"nombre": "salud_masvida_tokenvidaextra",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta",
	"skin_accesorio" : "12"
}
var evolucion_2_1_2 = {
	"nombre": "salud_masvida_regeneracion",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta",
	"skin_accesorio" : "22"
}
var evolucion_2_2 = {
	"nombre": "salud_masinmune",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta",
	"skin_accesorio" : "03"
}
var evolucion_2_2_1 = {
	"nombre": "salud_masinmune_escudo",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta",
	"skin_accesorio" : "13"
}
var evolucion_2_2_2 = {
	"nombre": "salud_masinmune_resiliente",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta",
	"skin_accesorio" : "23"
}
# EVOLUCION 3 : ATAQUE
var evolucion_3 = {
	"nombre": "ataque",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1.5,
	"rango": 1,
	"arma": "escopeta",
	"skin_accesorio" : "rojo"
}
var evolucion_3_1 = {
	"nombre": "ataque_cerca",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 2,
	"rango": 0.8,
	"arma": "escopeta",
	"skin_accesorio" : "04"
}
var evolucion_3_1_1 = {
	"nombre": "ataque_cerca_areaexplosiva",
	"cadencia": 1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 1.5,
	"rango": 0.75,
	"arma": "escopeta",
	"skin_accesorio" : "14"
}
var evolucion_3_1_2 = {
	"nombre": "ataque_cerca_penetramuros",
	"cadencia": 1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta",
	"skin_accesorio" : "24"
}
var evolucion_3_2 = {
	"nombre": "ataque_oneshoot",
	"cadencia": 0.7,
	"vida": 1,
	"velocidad": 0.9,
	"damage": 2,
	"rango": 5,
	"arma": "francotirador",
	"skin_accesorio" : "05"
}
var evolucion_3_2_1 = {
	"nombre": "ataque_oneshoot_francotirador",
	"cadencia": 0.8,
	"vida": 1,
	"velocidad": 1,
	"damage": 3,
	"rango": 3,
	"arma": "francotirador",
	"skin_accesorio" : "15"
}

var evolucion_3_2_2 = {
	"nombre": "ataque_oneshoot_bazooka",
	"cadencia": 0.5,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 2,
	"rango": 1,
	"arma": "bazooka",
	"skin_accesorio" : "25"
}
# EVOLUCION 4 : TIRO / DISPARO / CADENCIA
var evolucion_4 = {
	"nombre": "tiro",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 1.2,
	"rango": 1.3,
	"arma": "ametralladora",
	"skin_accesorio" : "amarillo"
}
var evolucion_4_1 = {
	"nombre": "tiro_dispersion",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 2,
	"arma": "ametralladora",
	"skin_accesorio" : "06"
}
var evolucion_4_1_1 = {
	"nombre": "tiro_dispersion_rebote",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 0.4,
	"rango": 1,
	"arma": "ametralladora",
	"skin_accesorio" : "16"
}
var evolucion_4_1_2 = {
	"nombre": "tiro_dispersion_360",
	"cadencia": 1.5,
	"vida": 1,
	"velocidad": 1,
	"damage": 0.3,
	"rango": 2,
	"arma": "ametralladora",
	"skin_accesorio" : "26"
}
var evolucion_4_2 = {
	"nombre": "tiro_cadencia",
	"cadencia": 1.5,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ametralladora",
	"skin_accesorio" : "07"
}
var evolucion_4_2_1 = {
	"nombre": "tiro_cadencia_doblearma",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1.5,
	"rango": 1.5,
	"arma": "ak-47",
	"skin_accesorio" : "17"
}
var evolucion_4_2_2 = {
	"nombre": "tiro_cadencia_infinita",
	"cadencia": 2,
	"vida": 1,
	"velocidad": 1,
	"damage": 0.8,
	"rango": 1,
	"arma": "ametralladora",
	"skin_accesorio" : "27"
}

var botones_arbol = Array()
var sprites_ramas_arbol = Array()

var evolucion_actual = ""
var evolucion_siguiente = ""
var seleccionado = 0

#----------------------------------------------------------

#var nombre_mapa = "MapaArena"
var nombre_mapa = Engine.get_meta("nombre_escena_mapa")
var evol_superior = Atributos["evol_"+nombre_mapa].evol_1 # por ej tendria "1"
var evol_inferior = Atributos["evol_"+nombre_mapa].evol_2 # por ej tendria "2"

var boton_superior = "boton_evolucion_"+evol_superior # "boton_evolucion_1"
var boton_inferior = "boton_evolucion_"+evol_inferior # "boton_evolucion_2"

var rama_superior
var rama_inferior

# Called when the node enters the scene tree for the first time.
func _ready():
	

	#---------------------------------------
	if !Engine.has_meta("evolucion_actual"):
		Engine.set_meta("evolucion_actual","evolucion")
		
	evolucion_actual = Engine.get_meta("evolucion_actual")
	armo_arbol()
	set_iconos_ramas()
	
	#--------------------------------------------------
	evolucion_siguiente = evolucion_actual+"xx"
	muestro_arbol()
	btn_seleccionar.set_disabled(true)
	carga_ventana()
	ventana_por_defecto()

func set_iconos_ramas():	
	var icono_1 = load("res://producto/assets/img/Iconos_Poderes/Iconos_Nodos_Arbol/Evoluciones/_"+evol_superior+".png")
	var icono_2 = load("res://producto/assets/img/Iconos_Poderes/Iconos_Nodos_Arbol/Evoluciones/_"+evol_inferior+".png")
	
	for i in range(1,8):
		botones_arbol[i].icon = icono_1
		botones_arbol[i+7].icon = icono_2

#actualizado
func armo_arbol():
	botones_arbol.append(boton_evolucion)
	
	var aux = "boton_evolucion_1"
	
	botones_arbol.append(self[aux])
	botones_arbol.append(self[aux+"_1"])
	botones_arbol.append(self[aux+"_1_1"])
	botones_arbol.append(self[aux+"_1_2"])
	botones_arbol.append(self[aux+"_2"])
	botones_arbol.append(self[aux+"_2_1"])
	botones_arbol.append(self[aux+"_2_2"])
	
	aux = "boton_evolucion_2"
	
	botones_arbol.append(self[aux])
	botones_arbol.append(self[aux+"_1"])
	botones_arbol.append(self[aux+"_1_1"])
	botones_arbol.append(self[aux+"_1_2"])
	botones_arbol.append(self[aux+"_2"])
	botones_arbol.append(self[aux+"_2_1"])
	botones_arbol.append(self[aux+"_2_2"])
	
	sprites_ramas_arbol.append(_1)
	sprites_ramas_arbol.append(_1_1)
	sprites_ramas_arbol.append(_1_1_1)
	sprites_ramas_arbol.append(_1_1_2)
	sprites_ramas_arbol.append(_1_2)
	sprites_ramas_arbol.append(_1_2_1)
	sprites_ramas_arbol.append(_1_2_2)
	
	#for i in range(7):
	#	sprites_ramas_arbol[i].name = "_"+evol_superior
	
	sprites_ramas_arbol.append(_2)
	sprites_ramas_arbol.append(_2_1)
	sprites_ramas_arbol.append(_2_1_1)
	sprites_ramas_arbol.append(_2_1_2)
	sprites_ramas_arbol.append(_2_2)
	sprites_ramas_arbol.append(_2_2_1)
	sprites_ramas_arbol.append(_2_2_2)

	#for i in range(7,13):
	#	sprites_ramas_arbol[i].name = "_"+evol_superior

func muestro_arbol():
	var longitud_actual = len(evolucion_actual)
	var evolucion_actual_aux = evolucion_actual
	
	
	print("la evolucion actual antes de modificarse es: ",evolucion_actual_aux)
	if evolucion_actual_aux.find("3") != -1:
		if evolucion_actual_aux[10] == evol_superior:
			evolucion_actual_aux[10] = "1"
		else:
			evolucion_actual_aux[10] = "2"
			
	elif evolucion_actual_aux.find("4") != -1:
		if evolucion_actual_aux[10] == evol_superior:
			evolucion_actual_aux[10] = "1"
		else:
			evolucion_actual_aux[10] = "2"
	
	print("la evolucion actual despues de modificarse es: ",evolucion_actual_aux)
	for boton in botones_arbol:
		print(boton.name)
		
		if longitud_actual+2<len(boton.name):#evoluciones que no llegaron
			boton.visible = false
		else:#evoluciones que ya pasaron
			if longitud_actual>=len(boton.name):
				boton.set_disabled(true)
			else:#mismo nivel
				if longitud_actual == 11 and evolucion_actual_aux[10]!=boton.name[10]:
					boton.set_disabled(true)
				else:
					if longitud_actual == 13 and (evolucion_actual_aux[10]!=boton.name[10] or evolucion_actual_aux[12]!=boton.name[12]):
						boton.set_disabled(true)


func carga_ventana():
	var ruta = Engine.get_meta("ruta_skin")
	var arma_actual = Engine.get_meta("arma_actual")
	var skin_body = load(ruta + "/body.png")
	var skin_arma = load(ruta+"/"+arma_actual+".png")
	
	sprite_jugador.set_texture(skin_body)
	sprite_arma.set_texture(skin_arma)
	animacion.play("move")
	actualizar_rama_arbol(evolucion_actual)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if seleccionado == 0:
		btn_seleccionar.set_disabled(true)
	else:
		btn_seleccionar.set_disabled(false)
		
func _on_Seleccionar_pressed():
	#print("longitud: ",len(evolucion_actual))
	#print("evol seleccionada: ",seleccionado)
	#print("evol superior: ",evol_superior)
	#print("evol inferior: ",evol_inferior)
	
	if len(evolucion_actual) >= 11:
		if str(seleccionado) == evol_superior:
			seleccionado = 1
		elif str(seleccionado) == evol_inferior:
			seleccionado = 2
		
	get_parent().actualiza_atributos(self[evolucion_actual + "_" + str(seleccionado)], str(seleccionado))
	evolucion_actual = evolucion_actual + "_" + str(seleccionado)
	get_tree().paused = false
	get_parent().on_evol_quit()
	#emit_signal("evolucionar")
	queue_free()
	Engine.set_meta("evolucion_actual",evolucion_actual)
	Engine.set_meta("arma_actual",self[evolucion_actual].arma)

func ventana_por_defecto():
	for evol in botones_arbol:
		if evolucion_actual == evol.name:
			evol.emit_signal("mouse_entered")

func ventana_actualizar(xtitulo="",xhistoria="",xhabilidad=""):
	titulo.text = xtitulo
	historia.text = xhistoria
	habilidad.text = xhabilidad

func actualizar_rama_arbol(evolucion):
	var rama_primer_nivel = ""
	var rama_segundo_nivel = ""
	print("La evolucion seleccionada es: ", evolucion)
	if len(evolucion) >= 10:
		if evolucion[10] != "1" or evolucion[10] != "2":
			print("evol_sup ",evol_superior)
			print("evol_inf ",evol_inferior)
				
			if evolucion[10] == evol_superior:
				evolucion[10] = "1"
			elif evolucion[10] == evol_inferior:
				evolucion[10] = "2"
	if len(evolucion) >= 13:
		rama_primer_nivel = formo_palabra(evolucion,10)
	if len(evolucion) >= 15:
		rama_segundo_nivel = formo_palabra(evolucion,12)
	for rama in sprites_ramas_arbol:
		if len(evolucion) == len(rama.name)+9:
			if "evolucion"+rama.name == evolucion:
				rama.visible = true
			else:
				rama.visible = false
		else:
			pass
		if  "evolucion"+rama.name == rama_primer_nivel or "evolucion"+rama.name == rama_segundo_nivel:
			rama.visible = true
	#recorro cada rama para ver si hay que mostrarla como seleccionada
	pass

func _on_evolucion_1_pressed(): # len("evolucion_1") = 11
	if( len(evolucion_actual) < 11 ):
		actualizar_rama_arbol("evolucion_"+evol_superior)
		#actualizar_rama_arbol("evolucion_1")
	seleccionado = int(evol_superior)
	#seleccionado = 1

func formo_palabra(palabra,limite):
	var aux = ""
	for i in range (0,len(palabra)):
		if i<= limite:
			aux += palabra[i]
	return aux

func _on_evolucion_2_pressed():
	if( len(evolucion_actual) < 11 ):
		actualizar_rama_arbol("evolucion_"+evol_inferior)
		#actualizar_rama_arbol("evolucion_2")
	seleccionado = int(evol_inferior)
	#seleccionado = 2

func _on_evolucion_1_1_pressed():
	if( len(evolucion_actual) < 13 ):
		actualizar_rama_arbol("evolucion_"+evol_superior+"_1")
		#actualizar_rama_arbol("evolucion_1_1")
	seleccionado = int(evol_superior)
	#seleccionado = 1

func _on_evolucion_1_2_pressed():
	if( len(evolucion_actual) < 13 ):
		actualizar_rama_arbol("evolucion_"+evol_superior+"_2")
		#actualizar_rama_arbol("evolucion_1_2")
	seleccionado = int(evol_inferior)
	#seleccionado = 2
	
func _on_evolucion_1_1_1_pressed():
	if( len(evolucion_actual) < 15 ):
		actualizar_rama_arbol("evolucion_"+evol_superior+"_1_1")
		#actualizar_rama_arbol("evolucion_1_1_1")
	seleccionado = int(evol_superior)
	#seleccionado = 1

func _on_evolucion_1_1_2_pressed():
	if( len(evolucion_actual) < 15 ):
		actualizar_rama_arbol("evolucion_"+evol_superior+"_1_2")
		#actualizar_rama_arbol("evolucion_1_1_2")
	seleccionado = int(evol_inferior)
	#seleccionado = 2

func _on_evolucion_1_2_1_pressed():
	if( len(evolucion_actual) < 15 ):
		actualizar_rama_arbol("evolucion_"+evol_superior+"_2_1")
		#actualizar_rama_arbol("evolucion_1_2_1")
	seleccionado = int(evol_superior)
	#seleccionado = 1

func _on_evolucion_1_2_2_pressed():
	if( len(evolucion_actual) < 15 ):
		actualizar_rama_arbol("evolucion_"+evol_superior+"_2_2")
		#actualizar_rama_arbol("evolucion_1_2_2")
	seleccionado = int(evol_inferior)
	#seleccionado = 2

func _on_evolucion_2_1_pressed():
	if( len(evolucion_actual) < 13 ):
		actualizar_rama_arbol("evolucion_"+evol_inferior+"_1")
		#actualizar_rama_arbol("evolucion_2_1")
	seleccionado = int(evol_superior)
	#seleccionado = 1

func _on_evolucion_2_2_pressed():
	if( len(evolucion_actual) < 13 ):
		actualizar_rama_arbol("evolucion_"+evol_inferior+"_2")
		#actualizar_rama_arbol("evolucion_2_2")
	seleccionado = int(evol_inferior)
	#seleccionado = 2

func _on_evolucion_2_1_1_pressed():
	if( len(evolucion_actual) < 15 ):
		actualizar_rama_arbol("evolucion_"+evol_inferior+"_1_1")
		#actualizar_rama_arbol("evolucion_2_1_1")
	seleccionado = int(evol_superior)
	#seleccionado = 1

func _on_evolucion_2_1_2_pressed():
	if( len(evolucion_actual) < 15 ):
		actualizar_rama_arbol("evolucion_"+evol_inferior+"_1_2")
		#actualizar_rama_arbol("evolucion_2_1_2")
	seleccionado = int(evol_inferior)
	#seleccionado = 2

func _on_evolucion_2_2_1_pressed():
	if( len(evolucion_actual) < 15 ):
		actualizar_rama_arbol("evolucion_"+evol_inferior+"_2_1")
		#actualizar_rama_arbol("evolucion_2_2_1")
	seleccionado = int(evol_superior)
	#seleccionado = 1

func _on_evolucion_2_2_2_pressed():
	if( len(evolucion_actual) < 15 ):
		actualizar_rama_arbol("evolucion_"+evol_inferior+"_2_2")
		#actualizar_rama_arbol("evolucion_2_2_2")
	seleccionado = int(evol_inferior)
	#seleccionado = 2

func _on_evolucion_mouse_entered():
	actualizar_sprite_ventana("arma_1","","")
	ventana_actualizar("INICIOS","El joven Max, antes de empezar su enfrentamiento con los monstruos, su historia recien ha empezado.","GANAS DE MATAR")

func _on_evolucion_mouse_exited():
	ventana_por_defecto()

func actualiza(nombre_evol):
	var _arma      = Atributos.evoluciones[nombre_evol].arma
	var _accesorio = Atributos.evoluciones[nombre_evol].skin_accesorio
	var _gorro     = Atributos.evoluciones[nombre_evol].gorro
	actualizar_sprite_ventana(_arma,_accesorio,_gorro)
	
	var _titulo    = Atributos.evoluciones[nombre_evol].titulo
	var _historia  = Atributos.evoluciones[nombre_evol].historia
	var _habilidad = Atributos.evoluciones[nombre_evol].habilidad
	ventana_actualizar(_titulo,_historia,_habilidad)


func _on_evolucion_1_mouse_entered():
	actualiza("evolucion_"+evol_superior)

func _on_evolucion_2_mouse_entered():
	actualiza("evolucion_"+evol_inferior)

func _on_evolucion_1_1_mouse_entered():
	actualiza("evolucion_"+evol_superior+"_1")

func _on_evolucion_1_2_mouse_entered():
	actualiza("evolucion_"+evol_superior+"_2")

func _on_evolucion_2_1_mouse_entered():
	actualiza("evolucion_"+evol_inferior+"_1")

func _on_evolucion_2_2_mouse_entered():
	actualiza("evolucion_"+evol_inferior+"_2")

func _on_evolucion_1_1_2_mouse_entered():
	actualiza("evolucion_"+evol_superior+"_1_2")

func _on_evolucion_1_1_1_mouse_entered():
	actualiza("evolucion_"+evol_superior+"_1_1")

func _on_evolucion_1_2_2_mouse_entered():
	actualiza("evolucion_"+evol_superior+"_2_2")

func _on_evolucion_1_2_1_mouse_entered():
	actualiza("evolucion_"+evol_superior+"_2_1")

func _on_evolucion_2_1_1_mouse_entered():
	actualiza("evolucion_"+evol_inferior+"_1_1")

func _on_evolucion_2_1_2_mouse_entered():
	actualiza("evolucion_"+evol_inferior+"_1_2")

func _on_evolucion_2_2_1_mouse_entered():
	actualiza("evolucion_"+evol_inferior+"_2_1")

func _on_evolucion_2_2_2_mouse_entered():
	actualiza("evolucion_"+evol_inferior+"_2_2")

func actualizar_sprite_ventana(arma,bandera,gorro):
	#var skin es para el accesorio que identifique a cada evolucion
	var ruta = Engine.get_meta("ruta_skin")
	var arma_actual = arma
	var skin_body = load(ruta + "/body.png")
	var skin_arma = load(ruta+"/"+arma_actual+".png")
	sprite_jugador.set_texture(skin_body)
	sprite_arma.set_texture(skin_arma)
	if bandera != "":
		var ruta_bandera = load("res://producto/assets/img/Accesorios/level_1/"+bandera+".png")
		sprite_bandera.set_texture(ruta_bandera)	
		sprite_bandera.visible = true
	else:
		sprite_bandera.visible = false
	if gorro !="":
		var ruta_gorro = ""
		var tipo_de_gorro = ""
		if gorro[0] == "2":
			ruta_gorro = load("res://producto/assets/img/Accesorios/level_2/gorros.png")
		else:
			if gorro[2] == "0":
				tipo_de_gorro = "gorros_coronados"
			else:
				tipo_de_gorro = "gorros_medalla_oro"
			ruta_gorro = load("res://producto/assets/img/Accesorios/level_3/"+tipo_de_gorro+".png")
		sprite_gorro.set_texture(ruta_gorro)
		sprite_gorro.frame = int(gorro[1])	
		sprite_gorro.visible = true
	else:
		sprite_gorro.visible = false
	pass
