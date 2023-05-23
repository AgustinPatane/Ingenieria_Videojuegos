extends Control

onready var btn_seleccionar = get_node("Seleccionar")
onready var ventana = get_node("Ventana")
onready var sprite_jugador = get_node("Ventana/Jugador")
onready var sprite_arma = get_node("Ventana/Arma")
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


onready var ramas_arbol = get_node("evolucion/ramas_arbol")

var n_primer_rama = "3"
var n_segunda_rama = "2"
var aux1 = "boton_evolucion_"+n_primer_rama
var aux2 = "boton_evolucion_"+n_segunda_rama

var botones_arbol = Array()
#____________________________________________________________


var evolucion_actual = ""
var evolucion_siguiente = ""
var seleccionado = 0

# EVOLUCION 1 : MOVIMIENTO / VELOCIDAD
var evolucion_1 = {
	"nombre": "movimiento",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1.5,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47"
}

var evolucion_1_1 = {
	"nombre": "movimiento_propio",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1.3,
	"damage": 1,
	"rango": 1.5,
	"arma": "ak-47"
}
var evolucion_1_1_2 = {
	"nombre": "movimiento_propio_atravesarmuros",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1.3,
	"arma": "ak-47"
}
var evolucion_1_1_1 = {
	"nombre": "movimiento_propio_nitro",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1.1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47"
}
var evolucion_1_2 = {
	"nombre": "movimiento_enemigos",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47"
}
var evolucion_1_2_1 = {
	"nombre": "movimiento_enemigos_ondaralentizadora",
	"cadencia": 1,
	"vida": 0.7,
	"velocidad": 1.2,
	"damage": 1,
	"rango": 0.8,
	"arma": "ak-47"
}
var evolucion_1_2_2 = {
	"nombre": "movimiento_enemigos_congelacion",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ak-47"
}

# EVOLUCION 2 : SALUD / VIDA

var evolucion_2 = {
	"nombre": "salud",
	"cadencia": 1,
	"vida": 2,
	"velocidad": 0.9,
	"damage": 1,
	"rango": 1,
	"arma": "rifle"
}

var evolucion_2_1 = {
	"nombre": "salud_masvida",
	"cadencia": 1,
	"vida": 2,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
}

var evolucion_2_1_1 = {
	"nombre": "salud_masvida_tokenvidaextra",
	"cadencia": 1,
	"vida": 1.2,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
}

var evolucion_2_1_2 = {
	"nombre": "salud_masvida_regeneracion",
	"cadencia": 1,
	"vida": 1.2,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
}

var evolucion_2_2 = {
	"nombre": "salud_masinmune",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
}

var evolucion_2_2_1 = {
	"nombre": "salud_masinmune_escudo",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
}

var evolucion_2_2_2 = {
	"nombre": "salud_masinmune_resiliente",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
}

# EVOLUCION 3 : ATAQUE

var evolucion_3 = {
	"nombre": "ataque",
	"cadencia": 0.75,
	"vida": 1.5,
	"velocidad": 0.75,
	"damage": 1.5,
	"rango": 1.5,
	"arma": "rifle"
}

var evolucion_3_1 = {
	"nombre": "ataque_cerca",
	"cadencia": 1,
	"vida": 3,
	"velocidad": 0.75,
	"damage": 1,
	"rango": 2,
	"arma": "escopeta"
}

var evolucion_3_1_1 = {
	"nombre": "ataque_cerca_areaexplosiva",
	"cadencia": 1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 1.5,
	"rango": 0.75,
	"arma": "escopeta"
}

var evolucion_3_1_2 = {
	"nombre": "ataque_cerca_penetramuros",
	"cadencia": 1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "escopeta"
}

var evolucion_3_2 = {
	"nombre": "ataque_oneshoot",
	"cadencia": 0.75,
	"vida": 1.5,
	"velocidad": 0.75,
	"damage": 2,
	"rango": 3,
	"arma": "francotirador"
}

var evolucion_3_2_1 = {
	"nombre": "ataque_oneshoot_francotirador",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 1.5,
	"rango": 1,
	"arma": "francotirador"
}

var evolucion_3_2_2 = {
	"nombre": "ataque_oneshoot_bazooka",
	"cadencia": 0.5,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 2,
	"rango": 1,
	"arma": "bazooka"
}


# EVOLUCION 4 : TIRO / DISPARO / CADENCIA

var evolucion_4 = {
	"nombre": "tiro",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ametralladora"
}

var evolucion_4_1 = {
	"nombre": "tiro_dispersion",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 1,
	"rango": 1,
	"arma": "ametralladora"
}

var evolucion_4_1_1 = {
	"nombre": "tiro_dispersion_rebote",
	"cadencia": 1.2,
	"vida": 1,
	"velocidad": 1,
	"damage": 4,
	"rango": 1,
	"arma": "ametralladora"
}

var evolucion_4_1_2 = {
	"nombre": "tiro_dispersion_360",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 2,
	"rango": 3,
	"arma": "ametralladora"
}

var evolucion_4_2 = {
	"nombre": "tiro_cadencia",
	"cadencia": 1.1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 2,
	"rango": 3,
	"arma": "ametralladora"
}

var evolucion_4_2_1 = {
	"nombre": "tiro_cadencia_doblearma",
	"cadencia": 1,
	"vida": 1,
	"velocidad": 1,
	"damage": 3,
	"rango": 1.5,
	"arma": "ak-47"
}

var evolucion_4_2_2 = {
	"nombre": "tiro_cadencia_infinita",
	"cadencia": 4,
	"vida": 1,
	"velocidad": 1,
	"damage": 0.2,
	"rango": 1,
	"arma": "ametralladora"
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
	ventana_actualizar("EL HOMBRE EXPLOSIVOS","algo algo algo.","BAZOOKA")
	if(len(evolucion_actual)<len("evolucion_2_2_2")):
		actualizar_rama_arbol("evolucion_2_2_2")
	seleccionado = 2

func _on_evolucion_mouse_entered():
	actualizar_sprite_ventana("inicios","arma_1")
	ventana_actualizar("INICIOS","El joven Max, antes de empezar a aniquilar monstruos, su historia recien ha empezado.","GANAS DE MATAR")

func _on_evolucion_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_mouse_entered():
	actualizar_sprite_ventana("el_rayo","ametralladora")
	ventana_actualizar("EL RAYO","Has acabado con muchos monstruos, quienes te han inculcado en tu ADN un gen que te permite realizar movimientos extra veloces.","+ VELOCIDAD")

func _on_evolucion_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_mouse_entered():
	actualizar_sprite_ventana("el_coloso","escopeta")
	ventana_actualizar("EL COLOSO","Has aguantado y sobrevivido de muchos seres peligrosos, no solo aumentas tu resistencia a ataques sino que ahora produces mucho mas impacto.","+ ATAQUE   + VIDA")

func _on_evolucion_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_1_mouse_entered():
	ventana_actualizar("LA LLUVIA DE PLOMO","Has adquirido experiencia en el manejo de tu arma, ahora disparas muchas balasd.","+ DISPAROS")

func _on_evolucion_1_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_2_mouse_entered():
	ventana_actualizar("FLASHMAX","Te desplazas a tan altas velocidades que te vuelves invisible cada unos segundos","INVISIBILIDAD")

func _on_evolucion_1_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_1_mouse_entered():
	ventana_actualizar("DISTORSIONADOR DE PROYECTILES","Has retocado tu arma y ahora disparas varias balas a la vez.","MULTPLES BALAS")

func _on_evolucion_2_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_2_mouse_entered():
	ventana_actualizar("OJO DE AGUILA","Aprendiste a apuntar como un francotirador profesional, un disparo, uno menos.","DISPARO MORTAL - ONE SHOOT")

func _on_evolucion_2_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_1_2_mouse_entered():
	ventana_actualizar("EL DOBLE GATILLO","Has utilizado el gen de clonación artifical para clonar tu arma, ahora tienes dos armas idénticas a tu favor.","DOBLE ARMA")

func _on_evolucion_1_1_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_1_1_mouse_entered():
	ventana_actualizar("LA RULETA 360","Obtienes el poder de controlar tus balas, ahora ellas vuelven a tí.","BALAS RETORNANTES")

func _on_evolucion_1_1_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_2_2_mouse_entered():
	ventana_actualizar("BAJO CERO LETAL","Mutaste, ahora controlas tu cuerpo y puedes teletransportarte 5 metros hacia adelante cada 10 segundos.","TELETRANSPORTE")

func _on_evolucion_1_2_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_1_2_1_mouse_entered():
	ventana_actualizar("EL MEXICANO FURIOSO","Sufres de un cambio en tu genoma humano y ahora estás compuesto de materia mezclada de restos de monstruos. Ahora, atraviesas muros y obstáculos.","ATRAVIESA MUROS Y OBSTÁCULOS")

func _on_evolucion_1_2_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_1_1_mouse_entered():
	ventana_actualizar("DOBLE PESADILLA","algo algo algo.","REBOTE DE BALAS")

func _on_evolucion_2_1_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_1_2_mouse_entered():
	ventana_actualizar("LA RULETA MORTAL","algo algo algo.","DISPARO EN 360 GRADOS")

func _on_evolucion_2_1_2_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_2_1_mouse_entered():
	ventana_actualizar("EL PENETRADOR","algo algo algo.","DISPARO PENETRANTE")

func _on_evolucion_2_2_1_mouse_exited():
	ventana_por_defecto()

func _on_evolucion_2_2_2_mouse_entered():
	actualizar_sprite_ventana("el_hombre_explosivos","bazooka")
	ventana_actualizar("EL HOMBRE EXPLOSIVOS","algo algo algo.","BAZOOKA")

func _on_evolucion_2_2_2_mouse_exited():
	ventana_por_defecto()

func actualizar_rama_arbol(evol):
	var ruta_rama = load("res://producto/assets/img/ramas_arbol/"+evol+".png")
	ramas_arbol.set_texture(ruta_rama)

func actualizar_sprite_ventana(skin,arma):
	#var skin es para el accesorio que identifique a cada evolucion
	var ruta = Engine.get_meta("ruta_skin")
	var arma_actual = arma
	var skin_body = load(ruta + "/body.png")
	var skin_arma = load(ruta+"/"+arma_actual+".png")
	sprite_jugador.set_texture(skin_body)
	sprite_arma.set_texture(skin_arma)
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
	pass # Replace with function body.


func _on_evolucion_3_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_1_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_3_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_1_1_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_3_1_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_1_2_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_3_1_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_2_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_3_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_2_1_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_3_2_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_3_2_2_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_3_2_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_4_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_1_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_4_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_1_1_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_4_1_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_1_2_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_4_1_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_2_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_4_2_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_2_1_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_4_2_1_mouse_exited():
	ventana_por_defecto()


func _on_evolucion_4_2_2_mouse_entered():
	pass # Replace with function body.


func _on_evolucion_4_2_2_mouse_exited():
	ventana_por_defecto()
