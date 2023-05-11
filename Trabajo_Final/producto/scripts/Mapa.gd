extends Node2D

var tiempo_curita 
var tiempo_Demonio 
var tiempo_Diablito 
var tiempo_Pilar 
var tiempo_Ojo_volador 
var tiempo_Gusano 
var tiempo_Hechicero 

var max_enemigos = 30
var cant_enemigos = 0
var timers_enemigos = []

onready var escena_item = preload("res://producto/assets/scenes/Item_curacion.tscn")
var jugador

func _ready():
	var tiempos = Atributos.get_tiempos()
	tiempo_Demonio = tiempos.demonio
	tiempo_Pilar = tiempos.pilar
	tiempo_Ojo_volador = tiempos.ojo
	tiempo_Gusano = tiempos.gusano
	tiempo_Hechicero = tiempos.hechicero
	tiempo_curita = tiempos.curita
	tiempo_Diablito = tiempos.diablito
	
	jugador = get_node("Jugador")
	jugador.connect("level_up",self,"sube_dificultad")
	randomize()

	var timer_objetos = Timer.new()
	self.add_child(timer_objetos)
	timer_objetos.wait_time = tiempo_curita
	timer_objetos.connect("timeout", self, "spawn_item_vida")
	timer_objetos.start()
	start_spawn_enemigo("Gusano")

	#start_spawn_enemigo("Ojo_volador")
	#start_spawn_enemigo("Diablito")
	#start_spawn_enemigo("Demonio")
	#start_spawn_enemigo("Pilar")
	#start_spawn_enemigo("Hechicero")
	#start_spawn_enemigo("Hongo")

func start_spawn_enemigo(tipo_enemigo: String):
	var timer = Timer.new()
	print("aaaaaaa"+tipo_enemigo)
	timer.wait_time = self["tiempo_"+tipo_enemigo]
	timer.connect("timeout", self, "spawn_enemigo",[tipo_enemigo])
	get_node("/root/Mapa").add_child(timer)
	timer.start()
	timers_enemigos.append(timer)

func sube_dificultad(nivel):
	if nivel == 2:
		start_spawn_enemigo("Ojo_volador")
	elif nivel == 3:
		start_spawn_enemigo("Diablito")
	elif nivel == 4:
		start_spawn_enemigo("Demonio")
	elif nivel == 5:
		start_spawn_enemigo("Pilar")
	elif nivel == 6:
		start_spawn_enemigo("Hechicero")

	for i in range(0,len(timers_enemigos)):
		timers_enemigos[i].wait_time *= 0.9

func spawn_enemigo(tipo_enemigo: String):
	if cant_enemigos < max_enemigos:
		cant_enemigos += 1
		var enemigo_scene = load("res://producto/assets/scenes/" + tipo_enemigo + ".tscn")
		var enemigo = enemigo_scene.instance()
		enemigo.position = posicion_aleatoria(tipo_enemigo)
		get_node("/root/Mapa").add_child(enemigo)

func spawn_timer(tipo_enemigo: String, tiempo: int):
	var timer_enemigos = Timer.new()
	self.add_child(timer_enemigos)
	timer_enemigos.wait_time = tiempo
	timer_enemigos.connect("timeout", self, "spawn_enemigo",[tipo_enemigo])
	timer_enemigos.start()

func spawn_item_vida():
	var item = escena_item.instance()
	item.position = Vector2(rand_range(-567,1651),rand_range(-411,980))
	get_node("/root/Mapa").add_child(item)

func posicion_aleatoria(tipo_enemigo) -> Vector2:
	var result
	if rand_range(0, 1)<=0.5:
		result=1
	else:
		result=-1
	var posx
	var posy
	if tipo_enemigo == "Pilar":
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
	
func _process(_delta):
	pass

func _on_Jugador_player_defeated():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/MenuDerrota.tscn")
