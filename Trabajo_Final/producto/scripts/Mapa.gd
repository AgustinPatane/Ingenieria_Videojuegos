extends Node2D

var tiempo_curita 

var tiempo_Demonio 
var tiempo_Diablito 
var tiempo_Pilar 
var tiempo_Ojo_volador 
var tiempo_Gusano 
var tiempo_Hechicero 
var tiempo_Hongo

var nivel_demonio
var nivel_diablito
var nivel_pilar
var nivel_ojo
var nivel_gusano
var nivel_hechicero
var nivel_hongo

var max_enemigos
var cant_enemigos = 0
var timers_enemigos = []

onready var escena_item = preload("res://producto/assets/scenes/Item_curacion.tscn")
var jugador
var nombre_mapa

func _ready():
	SoundManager.set_musica_partida()
	var tiempos = Atributos.get_tiempos()
	tiempo_Demonio = tiempos.demonio
	tiempo_Pilar = tiempos.pilar
	tiempo_Ojo_volador = tiempos.ojo
	tiempo_Gusano = tiempos.gusano
	tiempo_Hechicero = tiempos.hechicero
	tiempo_curita = tiempos.curita
	tiempo_Diablito = tiempos.diablito

	set_tiempos()
	set_niveles_spawn()

	
	jugador = get_node("Jugador")
	jugador.connect("level_up",self,"sube_dificultad")
	jugador.connect("freeze",self,"freeze")
	randomize()

	var timer_objetos = Timer.new()
	self.add_child(timer_objetos)
	timer_objetos.wait_time = tiempo_curita
	timer_objetos.connect("timeout", self, "spawn_item_vida")
	timer_objetos.start()
	sube_dificultad(1)
	establecer_fondo_mapa()

func set_niveles_spawn():
	max_enemigos = Atributos.max_enemigos
	var niveles = Atributos.get_niveles_spawn()
	
	nivel_demonio = niveles.demonio
	nivel_diablito = niveles.diablito
	nivel_pilar = niveles.pilar
	nivel_ojo = niveles.ojo
	nivel_gusano = niveles.gusano
	nivel_hechicero = niveles.hechicero
	nivel_hongo = niveles.hongo

func set_tiempos():
	var tiempos = Atributos.get_tiempos()
	
	tiempo_Demonio = tiempos.demonio
	tiempo_Diablito = tiempos.diablito
	tiempo_Pilar = tiempos.pilar
	tiempo_Ojo_volador = tiempos.ojo
	tiempo_Gusano = tiempos.gusano
	tiempo_Hechicero = tiempos.hechicero
	tiempo_Hongo = tiempos.hongo
	
	tiempo_curita = tiempos.curita

func start_spawn_enemigo(tipo_enemigo: String):
	spawn_enemigo(tipo_enemigo)
	var timer = Timer.new()
	timer.wait_time = self["tiempo_"+tipo_enemigo]
	timer.connect("timeout", self, "spawn_enemigo",[tipo_enemigo])
	get_node("/root/"+nombre_mapa).add_child(timer)
	timer.start()
	timers_enemigos.append(timer)

func sube_dificultad(nivel):
	if nivel == nivel_gusano:
		start_spawn_enemigo("Gusano")
	if nivel == nivel_ojo:
		start_spawn_enemigo("Ojo_volador")
	if nivel == nivel_diablito:
		start_spawn_enemigo("Diablito")
	if nivel == nivel_demonio:
		start_spawn_enemigo("Demonio")
	if nivel == nivel_pilar:
		start_spawn_enemigo("Pilar")
	if nivel == nivel_hechicero:
		start_spawn_enemigo("Hechicero")
	if nivel == nivel_hongo:
		start_spawn_enemigo("Hongo")

	if nivel > 1:
		for i in range(0,len(timers_enemigos)):
			timers_enemigos[i].wait_time *= 0.9

func spawn_enemigo(tipo_enemigo: String):
	if cant_enemigos < max_enemigos:
		cant_enemigos += 1
		var enemigo_scene = load("res://producto/assets/scenes/" + tipo_enemigo + ".tscn")
		var enemigo = enemigo_scene.instance()
		enemigo.position = posicion_aleatoria(tipo_enemigo)
		nombre_mapa=Engine.get_meta("nombre_escena_mapa")
		get_node("/root/"+nombre_mapa).add_child(enemigo)

func spawn_timer(tipo_enemigo: String, tiempo: int):
	var timer_enemigos = Timer.new()
	self.add_child(timer_enemigos)
	timer_enemigos.wait_time = tiempo
	timer_enemigos.connect("timeout", self, "spawn_enemigo",[tipo_enemigo])
	timer_enemigos.start()

func spawn_item_vida():
	var item = escena_item.instance()
	item.position = Vector2(rand_range(-567,1651),rand_range(-411,980))
	get_node("/root/"+nombre_mapa).add_child(item)

func posicion_aleatoria(tipo_enemigo) -> Vector2:
	var result
	if rand_range(0, 1)<=0.5:
		result=1
	else:
		result=-1
	var posx
	var posy
	if tipo_enemigo != "Pilar" and tipo_enemigo!="Hongo":
		var pos1 = Vector2(rand_range(-1200,-570),rand_range(-1200,1400))
		var pos2 = Vector2(rand_range(1670,2300),rand_range(-1200,1400))
		var pos3 = Vector2(rand_range(-1200,2300),rand_range(-800,-420))
		var pos4 = Vector2(rand_range(-1200,2300),rand_range(1000,1400))
		var posiciones = [pos1,pos2,pos3,pos4]	
		var pos = posiciones[rand_range(0,3)]
		posx = pos[0]
		posy = pos[1]
	else:
		posx = rand_range(-567,1651)
		posy = rand_range(-411,980)
		if abs(posx) - abs(jugador.position.x) < 20 and abs(posy) - abs(jugador.position.y) < 20:
			posx += 20 * result 
			posy += 20 * result
	return Vector2(posx,posy)

func _on_Jugador_player_defeated():
	SoundManager.stop_musica()
	Engine.set_meta("Mapa",nombre_mapa)
	var _aux = get_tree().change_scene("res://producto/assets/scenes/MenuDerrota.tscn")

func freeze():
	SoundManager.play_congelar()

func establecer_fondo_mapa():
	#var numero = Engine.get_meta("numero_de_mapa")
	#var ruta = load("res://producto/assets/img/Mapas/"+str(numero)+".png")
	#$Fondo_elegido.set_texture(ruta)
	#numero *= 10
	#var ruta2 = load("res://producto/assets/img/Mapas/"+str(numero)+".png")
	#$Fondo_bordes.set_texture(ruta2)
	#if numero == 3:
	#	$Obstaculos_por_mapa/Mapa_3.set_process(true)
	var escenaMapa = "Mapa"
	
	
	
	
	
	
	
	

################ACOMODAR ESTO DE ABAJO##################

# -------- OBSTACULOS MAPA 3 ----------
func _on_Lava_1_area_entered(_area):
	#si un enemigo entra a la lava
	#si un proyectil entra en la lava...
	pass # Replace with function body.

func _process(_delta):
	#$Obstaculos_por_mapa/Mapa_3/Llamas.position = jugador.position
	pass

func _on_Lava_1_body_entered(_body):
	#if body.name == jugador.name:
		#$Obstaculos_por_mapa/Mapa_3/Llamas.visible = true
		#$Obstaculos_por_mapa/Mapa_3/Llamas/AnimatedSprite.play("llamas")
	pass
