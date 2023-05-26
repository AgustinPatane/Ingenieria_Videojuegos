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


onready var boton_evolucion_3 = get_node("evolucion/evolucion_3")

onready var boton_evolucion_3_1 = get_node("evolucion/evolucion_3/evolucion_3_1")
onready var boton_evolucion_3_1_1 = get_node("evolucion/evolucion_3/evolucion_3_1/evolucion_3_1_1")
onready var boton_evolucion_3_1_2 = get_node("evolucion/evolucion_3/evolucion_3_1/evolucion_3_1_2")

onready var boton_evolucion_3_2 = get_node("evolucion/evolucion_3/evolucion_3_2")
onready var boton_evolucion_3_2_1 = get_node("evolucion/evolucion_3/evolucion_3_2/evolucion_3_2_1")
onready var boton_evolucion_3_2_2 = get_node("evolucion/evolucion_3/evolucion_3_2/evolucion_3_2_2")


onready var boton_evolucion_4 = get_node("evolucion/evolucion_4")

onready var boton_evolucion_4_1 = get_node("evolucion/evolucion_4/evolucion_4_1")
onready var boton_evolucion_4_1_1 = get_node("evolucion/evolucion_4/evolucion_4_1/evolucion_4_1_1")
onready var boton_evolucion_4_1_2 = get_node("evolucion/evolucion_4/evolucion_4_1/evolucion_4_1_2")

onready var boton_evolucion_4_2 = get_node("evolucion/evolucion_4/evolucion_4_2")
onready var boton_evolucion_4_2_1 = get_node("evolucion/evolucion_4/evolucion_4_2/evolucion_4_2_1")
onready var boton_evolucion_4_2_2 = get_node("evolucion/evolucion_4/evolucion_4_2/evolucion_4_2_2")


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

var n_primer_rama = "1"
var n_segunda_rama = "2"
var aux1 = "boton_evolucion_"+n_primer_rama
var aux2 = "boton_evolucion_"+n_segunda_rama

var botones_arbol = Array()
var sprites_ramas_arbol = Array()
#____________________________________________________________


var evolucion_actual = ""
var evolucion_siguiente = ""
var seleccionado = 0

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

# Called when the node enters the scene tree for the first time.
func _ready():
	
	set_ramas_ok()
	if Engine.has_meta("evolucion_actual"):
		evolucion_actual = Engine.get_meta("evolucion_actual")
	else:
		Engine.set_meta("evolucion_actual","evolucion")
	evolucion_actual = Engine.get_meta("evolucion_actual")
	evolucion_siguiente = evolucion_actual+"xx"
	armo_arbol()
	muestro_arbol()
	btn_seleccionar.set_disabled(true)
	carga_ventana()
	ventana_por_defecto()

func set_ramas_ok():
	boton_evolucion_1.visible = false
	boton_evolucion_2.visible = false
	boton_evolucion_3.visible = false
	boton_evolucion_4.visible = false
	boton_evolucion_1.set_process(false)
	boton_evolucion_2.set_process(false)
	boton_evolucion_3.set_process(false)
	boton_evolucion_4.set_process(false)
	self[aux1].set_process(true)
	self[aux1].visible = true
	self[aux2].set_process(true)
	self[aux2].visible = true
	pass

func armo_arbol():
	botones_arbol.append(boton_evolucion)
	
	botones_arbol.append(self[aux1])
	botones_arbol.append(self[aux1+"_1"])
	botones_arbol.append(self[aux1+"_1_1"])
	botones_arbol.append(self[aux1+"_1_2"])
	botones_arbol.append(self[aux1+"_2"])
	botones_arbol.append(self[aux1+"_2_1"])
	botones_arbol.append(self[aux1+"_2_2"])
	
	botones_arbol.append(self[aux2])
	botones_arbol.append(self[aux2+"_1"])
	botones_arbol.append(self[aux2+"_1_1"])
	botones_arbol.append(self[aux2+"_1_2"])
	botones_arbol.append(self[aux2+"_2"])
	botones_arbol.append(self[aux2+"_2_1"])
	botones_arbol.append(self[aux2+"_2_2"])
	
	
	sprites_ramas_arbol.append(_1)
	sprites_ramas_arbol.append(_1_1)
	sprites_ramas_arbol.append(_1_1_1)
	sprites_ramas_arbol.append(_1_1_2)
	sprites_ramas_arbol.append(_1_2)
	sprites_ramas_arbol.append(_1_2_1)
	sprites_ramas_arbol.append(_1_2_2)
	
	sprites_ramas_arbol.append(_2)
	sprites_ramas_arbol.append(_2_1)
	sprites_ramas_arbol.append(_2_1_1)
	sprites_ramas_arbol.append(_2_1_2)
	sprites_ramas_arbol.append(_2_2)
	sprites_ramas_arbol.append(_2_2_1)
	sprites_ramas_arbol.append(_2_2_2)

func muestro_arbol():
	var longitud_actual = len(evolucion_actual)
	for boton in botones_arbol:
		if longitud_actual+2<len(boton.name):#evoluciones que no llegaron
			boton.visible = false
		else:#evoluciones que ya pasaron
			if longitud_actual>=len(boton.name):
				boton.set_disabled(true)
			else:#mismo nivel
				if longitud_actual == 11 and evolucion_actual[10]!=boton.name[10]:
					boton.set_disabled(true)
				else:
					if longitud_actual == 13 and (evolucion_actual[10]!=boton.name[10] or evolucion_actual[12]!=boton.name[12]):
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
	
	#unifico ramas superiores e inferiores
	if len(evolucion)>=11:
		if evolucion[10] == "3":
			evolucion[10] = "1"
		else:
			if evolucion[10] == "4":
				evolucion[10] = "2"
				
	if len(evolucion) >= 13:
		rama_primer_nivel = formo_palabra(evolucion,10)
	if len(evolucion) >= 15:
		rama_segundo_nivel = formo_palabra(evolucion,12)
	
	#recorro cada rama para ver si hay que mostrarla como seleccionada
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
	pass

func formo_palabra(palabra,limite):
	var aux = ""
	for i in range (0,len(palabra)):
		if i<= limite:
			aux += palabra[i]
	return aux

func _on_evolucion_1_pressed():
	if(len(evolucion_actual)<len("evolucion_1")):
		actualizar_rama_arbol("evolucion_1")
	seleccionado = 1

func _on_evolucion_2_pressed():
	if(len(evolucion_actual)<len("evolucion_2")):
		actualizar_rama_arbol("evolucion_2")
	seleccionado = 2

func _on_evolucion_1_1_pressed():
	if(len(evolucion_actual)<len("evolucion_1_1")):
		actualizar_rama_arbol("evolucion_1_1")
	seleccionado = 1

func _on_evolucion_1_2_pressed():
	if(len(evolucion_actual)<len("evolucion_1_2")):
		actualizar_rama_arbol("evolucion_1_2")
	seleccionado = 2
	
func _on_evolucion_1_1_1_pressed():
	if(len(evolucion_actual)<len("evolucion_1_1_1")):
		actualizar_rama_arbol("evolucion_1_1_1")
	seleccionado = 1

func _on_evolucion_1_1_2_pressed():
	if(len(evolucion_actual)<len("evolucion_1_1_2")):
		actualizar_rama_arbol("evolucion_1_1_2")
	seleccionado = 2

func _on_evolucion_1_2_1_pressed():
	if(len(evolucion_actual)<len("evolucion_1_2_1")):
		actualizar_rama_arbol("evolucion_1_2_1")
	seleccionado = 1

func _on_evolucion_1_2_2_pressed():
	if(len(evolucion_actual)<len("evolucion_1_2_2")):
		actualizar_rama_arbol("evolucion_1_2_2")
	seleccionado = 2

func _on_evolucion_2_1_pressed():
	if(len(evolucion_actual)<len("evolucion_2_1")):
		actualizar_rama_arbol("evolucion_2_1")
	seleccionado = 1

func _on_evolucion_2_2_pressed():
	if(len(evolucion_actual)<len("evolucion_2_2")):
		actualizar_rama_arbol("evolucion_2_2")
	seleccionado = 2

func _on_evolucion_2_1_1_pressed():
	if(len(evolucion_actual)<len("evolucion_2_1_1")):
		actualizar_rama_arbol("evolucion_2_1_1")
	seleccionado = 1

func _on_evolucion_2_1_2_pressed():
	if(len(evolucion_actual)<len("evolucion_2_1_2")):
		actualizar_rama_arbol("evolucion_2_1_2")
	seleccionado = 2

func _on_evolucion_2_2_1_pressed():
	if(len(evolucion_actual)<len("evolucion_2_2_1")):
		actualizar_rama_arbol("evolucion_2_2_1")
	seleccionado = 1

func _on_evolucion_2_2_2_pressed():	
	if(len(evolucion_actual)<len("evolucion_2_2_2")):
		actualizar_rama_arbol("evolucion_2_2_2")
	seleccionado = 2

func _on_evolucion_mouse_entered():
	actualizar_sprite_ventana("arma_1","","")
	ventana_actualizar("INICIOS","El joven Max, antes de empezar su enfrentamiento con los monstruos, su historia recien ha empezado.","GANAS DE MATAR")

func _on_evolucion_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_mouse_entered():
	actualizar_sprite_ventana("ak-47","azul","")
	ventana_actualizar("MAX AGIL","Has acabado con muchos monstruos, quienes te han inculcado en tu ADN un gen con el que aprenderas a controlar el movimiento de los seres vivos","+ VELOCIDAD")

func _on_evolucion_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_mouse_entered():
	actualizar_sprite_ventana("escopeta","verde","")
	ventana_actualizar("EL COLOSO","Has aguantado y sobrevivido de muchos seres peligrosos, aumentas tu resistencia a ataques.","+ VIDA")

func _on_evolucion_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_1_mouse_entered():
	actualizar_sprite_ventana("ak-47","azul","200")
	ventana_actualizar("EL VELOCISTA MAX","Luego de tanto desplazamiento luchando contra los monstruos, has aprendido a moverte mejor.","+ VELOCIDAD")

func _on_evolucion_1_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_2_mouse_entered():
	actualizar_sprite_ventana("ak-47","azul","210")
	ventana_actualizar("EL RALENTIZADOR MAX","Has afectado el terreno de movimiento, ahora logras que tus enemigos se muevan con menos velocidad.","ENEMIGOS MAS LENTOS")

func _on_evolucion_1_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_1_mouse_entered():
	actualizar_sprite_ventana("bazooka","verde","220")
	ventana_actualizar("EL TANQUE MAX","Has pasado por una mutacion en tu ADN genetico que provoca que tengas muchas mas vida.","++ VIDA")

func _on_evolucion_2_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_2_mouse_entered():
	actualizar_sprite_ventana("bazooka","verde","230")
	ventana_actualizar("LA ROCA MAX","Has mutado con tu resistencia, ahora tienes mucho mas aguante a los ataques enemigos.","+ RESISTENCIA")

func _on_evolucion_2_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_1_2_mouse_entered():
	actualizar_sprite_ventana("ak-47","verde","301")
	ventana_actualizar("FANTASMAX","Luego de haber aprendido a manejar tu velocidad, has saltado a otro nivel: ahora puedes pasar por encima de lo que quieras, como un fantasma.","ATRAVIESAS OBSTACULOS")

func _on_evolucion_1_1_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_1_1_mouse_entered():
	actualizar_sprite_ventana("ak-47","verde","300")
	ventana_actualizar("NITROMAX","Obtienes el poder de tener una super velocidad temporal cuando lo desees cada cierto tiempo.","PODER DE SUPER VELOCIDAD")

func _on_evolucion_1_1_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_2_2_mouse_entered():
	actualizar_sprite_ventana("ak-47","verde","311")
	ventana_actualizar("EL CONGELADOR AMX","Obtienes el pdoer de congelar temporalmente a tus enemigos cada cierto tiempo.","PODER DE CONGELAMIENTO")

func _on_evolucion_1_2_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_2_1_mouse_entered():
	actualizar_sprite_ventana("ak-47","verde","310")
	ventana_actualizar("LA AURA RALENTIZADORA","Has comenzado a generar moleculas que provocan que tus enemigos al acercarte a ti se muevan mucho mas lento","RADIO DE RALENTIZACION")

func _on_evolucion_1_2_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_1_1_mouse_entered():
	actualizar_sprite_ventana("escopeta","verde","320")
	ventana_actualizar("MAXUSCRISTO","Un milagro ocurrira si mueres, probablemente logres un unica resurrecciona, aprovechala.","VIDA EXTRA")

func _on_evolucion_2_1_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_1_2_mouse_entered():
	actualizar_sprite_ventana("escopeta","verde","321")
	ventana_actualizar("MAX REGENERATIVO","Han mutado todos tus sistemas, ahora logras regenrar tu vida cada cierto tiempo.","REGENERACION DE VIDA")

func _on_evolucion_2_1_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_2_1_mouse_entered():
	actualizar_sprite_ventana("bazooka","verde","330")
	ventana_actualizar("MAX INMUNE","Obtienes el poder de ser inmune temporalmente cada cierto tiempo.","PODER DE ESCUDO")

func _on_evolucion_2_2_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_2_2_mouse_entered():
	actualizar_sprite_ventana("bazooka","verde","331")
	ventana_actualizar("LA RESISTENCIA","Cuando te queda poca vida, los ataques enemigos te afectan menos.","+ RESISTENCIA")

func _on_evolucion_2_2_2_mouse_exited():
	ventana_por_defecto()

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

func _on_evolucion_3_pressed():
	if(len(evolucion_actual)<len("evolucion_3")):
		actualizar_rama_arbol("evolucion_3")
	seleccionado = 3

func _on_evolucion_3_1_pressed():
	if(len(evolucion_actual)<len("evolucion_3_1")):
		actualizar_rama_arbol("evolucion_3_1")
	seleccionado = 1

func _on_evolucion_3_1_1_pressed():
	if(len(evolucion_actual)<len("evolucion_3_1_1")):
		actualizar_rama_arbol("evolucion_3_1_1")
	seleccionado = 1

func _on_evolucion_3_1_2_pressed():
	if(len(evolucion_actual)<len("evolucion_3_1_2")):
		actualizar_rama_arbol("evolucion_3_1_2")
	seleccionado = 2

func _on_evolucion_3_2_pressed():
	if(len(evolucion_actual)<len("evolucion_3_2")):
		actualizar_rama_arbol("evolucion_3_2")
	seleccionado = 2

func _on_evolucion_3_2_1_pressed():
	if(len(evolucion_actual)<len("evolucion_3_2_1")):
		actualizar_rama_arbol("evolucion_3_2_1")
	seleccionado = 1

func _on_evolucion_3_2_2_pressed():
	if(len(evolucion_actual)<len("evolucion_3_2_2")):
		actualizar_rama_arbol("evolucion_3_2_2")
	seleccionado = 2

func _on_evolucion_4_pressed():
	if(len(evolucion_actual)<len("evolucion_4")):
		actualizar_rama_arbol("evolucion_4")
	seleccionado = 4

func _on_evolucion_4_1_pressed():
	if(len(evolucion_actual)<len("evolucion_4_1")):
		actualizar_rama_arbol("evolucion_4_1")
	seleccionado = 1

func _on_evolucion_4_1_1_pressed():
	if(len(evolucion_actual)<len("evolucion_4_1_1")):
		actualizar_rama_arbol("evolucion_4_1_1")
	seleccionado = 1

func _on_evolucion_4_1_2_pressed():
	if(len(evolucion_actual)<len("evolucion_4_1_2")):
		actualizar_rama_arbol("evolucion_4_1_2")
	seleccionado = 2

func _on_evolucion_4_2_pressed():
	if(len(evolucion_actual)<len("evolucion_4_2")):
		actualizar_rama_arbol("evolucion_4_2")
	seleccionado = 2

func _on_evolucion_4_2_1_pressed():
	if(len(evolucion_actual)<len("evolucion_4_2_1")):
		actualizar_rama_arbol("evolucion_4_2_1")
	seleccionado = 1

func _on_evolucion_4_2_2_pressed():
	if(len(evolucion_actual)<len("evolucion_4_2_2")):
		actualizar_rama_arbol("evolucion_4_2_2")
	seleccionado = 2



func _on_evolucion_3_mouse_entered():	
	actualizar_sprite_ventana("escopeta","rojo","")
	ventana_actualizar("FORZAMAX","Incrementas tu fuerza, cada impacto que reciben tus enemigos son mas influyentes.","+ FUERZA")
	pass # Replace with function body.


func _on_evolucion_3_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_1_mouse_entered():
	actualizar_sprite_ventana("escopeta","rojo","240")
	ventana_actualizar("MAX INTELIGENTE","Aprendes a provocar ataques criticos a poca distnacia.","+ ATAQUE EN - RANGO")
	pass # Replace with function body.


func _on_evolucion_3_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_1_1_mouse_entered():
	actualizar_sprite_ventana("escopeta","rojo","340")
	ventana_actualizar("LA BOMBA DE MAX","Has aprendido a fabricar bombas, ahora, queda en ti saber usarlas.","PODER DE RADIO EXPLOSIVO")
	pass # Replace with function body.


func _on_evolucion_3_1_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_1_2_mouse_entered():
	actualizar_sprite_ventana("escopeta","rojo","341")
	ventana_actualizar("LA LOCURA DE MAX","Tus ataques ahora no respetan las leyes de la fisica, pueden atravesar obstaculos.","ATAQUE PENETRANTE")
	pass # Replace with function body.


func _on_evolucion_3_1_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_2_mouse_entered():
	actualizar_sprite_ventana("rifle","rojo","250")
	ventana_actualizar("OJO DE AGUILA","Involucras todas tus fuerzas en tus disparos, provocas impactos letales.","+ ATAQUE EN + RANGO")
	pass # Replace with function body.


func _on_evolucion_3_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_2_1_mouse_entered():
	actualizar_sprite_ventana("francotirador","rojo","350")
	ventana_actualizar("EL FRANCOTIRADOR","Has aprendido a usar un francotirador, prueba que tan letal es.","ATAQUE LETAL")
	pass # Replace with function body.


func _on_evolucion_3_2_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_2_2_mouse_entered():
	actualizar_sprite_ventana("bazooka","rojo","351")
	ventana_actualizar("MAX BAZOOKAS","Has aprendido a usar una bazooka, cuidado con las explosiones letales.","ATAQUES EXPLOSIVOS")
	pass # Replace with function body.


func _on_evolucion_3_2_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_mouse_entered():
	actualizar_sprite_ventana("ametralladora","amarillo","")
	ventana_actualizar("EXPERTO EN ARMAS","Empiezas tu camino en aprender el uso de armas, mejorar los rangos de disparo y la cantidad","+ CADENCIA + RANGO")
	pass # Replace with function body.


func _on_evolucion_4_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_1_mouse_entered():
	actualizar_sprite_ventana("ametralladora","amarillo","260")
	ventana_actualizar("LA LLUVIA DE PLOMO","Controlas tus disapros y aprendes a disparar mas de una balas a la vez gracias a tu nueva ametralladora.","DISPERSION DE DISPAROS")
	pass # Replace with function body.


func _on_evolucion_4_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_1_1_mouse_entered():
	actualizar_sprite_ventana("ametralladora","amarillo","360")
	ventana_actualizar("REBOTES MORTALES","Modificas tus balas con el objetivo de que estas reboten entre enemigos. Puede ser letal para ellos.","REBOTE DE BALAS")
	pass # Replace with function body.


func _on_evolucion_4_1_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_1_2_mouse_entered():
	actualizar_sprite_ventana("ametralladora","amarillo","361")
	ventana_actualizar("FUEGOS ARTIFICALES","Has llegado a un nivel tan alto de manejo del arma que puedes disparar a todo tu alrededor.","DISPARO EN 360 GRADOS")
	pass # Replace with function body.


func _on_evolucion_4_1_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_2_mouse_entered():
	actualizar_sprite_ventana("ametralladora","amarillo","270")
	ventana_actualizar("EL TREN DE PLOMO","Aprendes a realizar un disparo aturdidor con muchas balas a la vez.","+ CADENCIA")
	pass # Replace with function body.


func _on_evolucion_4_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_2_1_mouse_entered():
	actualizar_sprite_ventana("ametralladora","amarillo","370")
	ventana_actualizar("DOBLE PESADILLA","Obtienes una nueva arma gracias a tu habilidad de saber como fabricarlas.","DOBLE ARMA")
	pass # Replace with function body.


func _on_evolucion_4_2_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_2_2_mouse_entered():
	actualizar_sprite_ventana("ametralladora","amarillo","371")
	ventana_actualizar("RAFAGA DE PLOMO","Obtienes el poder de tener una cadencia muy alta temporal cada ciertos segundos.","PODER DE CADENCIA INFINITA")
	pass # Replace with function body.


func _on_evolucion_4_2_2_mouse_exited():
	ventana_por_defecto()
