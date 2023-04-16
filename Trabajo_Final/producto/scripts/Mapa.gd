extends Node2D

<<<<<<< Updated upstream
export(int) var tiempo_spawn_enemigo = 1
export(int) var tiempo_spawn_curita = 10
var max_enemigos = 50
=======
var tiempo_spawn_enemigo = 1000
var tiempo_spawn_curita = 1
var max_enemigos = 30
>>>>>>> Stashed changes
var cant_enemigos = 0
onready var escena_enemigo = preload("res://producto/assets/scenes/Enemigo.tscn")
onready var escena_mago = preload("res://producto/assets/scenes/Mago.tscn")
onready var escena_demonio = preload("res://producto/assets/scenes/Demonio.tscn")
onready var escena_item = preload("res://producto/assets/scenes/Item.tscn")
var jugador

<<<<<<< Updated upstream
func _ready():
	jugador = get_node("Jugador")
	randomize()
	var timer_enemigos = Timer.new()
	self.add_child(timer_enemigos)
	timer_enemigos.wait_time = tiempo_spawn_enemigo
	timer_enemigos.connect("timeout", self, "spawn_enemigo")
	timer_enemigos.start()
	
	var timer_objetos = Timer.new()
	self.add_child(timer_objetos)
	timer_objetos.wait_time = tiempo_spawn_curita
	timer_objetos.connect("timeout", self, "spawn_objeto")
	timer_objetos.start()
	
func spawn_enemigo():
	if cant_enemigos < max_enemigos:
		cant_enemigos += 1
		var posx = jugador.position.x + rand_range(-800, 800)
		var posy = jugador.position.y + rand_range(-500, 500)
		var enemigo = escena_enemigo.instance()
		enemigo. position = Vector2(posx,posy)
		get_node("/root/Mapa").add_child(enemigo)
		print(cant_enemigos)
	

func spawn_objeto():
	#aca tendriamos que elegir cual item vamos a spawnear
	spawn_item_vida()

	
func spawn_item_vida():
	var posx = jugador.position.x + rand_range(-800, 800)
	var posy = jugador.position.y + rand_range(-500, 500)
	var item = escena_item.instance()
	item.position = Vector2(posx,posy)
	get_node("/root/Mapa").add_child(item)
=======

signal spawn_enemy


func _ready():
	jugador = get_node("Jugador")
	randomize()
	
	
	var timer_objetos = Timer.new()
	self.add_child(timer_objetos)
	timer_objetos.wait_time = tiempo_spawn_curita
	timer_objetos.connect("timeout", self, "spawn_item_vida")
	timer_objetos.start()

	#Lo ideal seria que se emita la señal, y luego mediante algun tiempo se decida cuando se genera el enemigo. De esta forma arrancan de una dos enemigos.
	get_node("/root/Mapa").add_child(escena_mago.instance())
	get_node("/root/Mapa").add_child(escena_demonio.instance())
	emit_signal("spawn_enemy")
	##################################
	
	
func spawn_enemigo(tipo_enemigo: String):
	if cant_enemigos < max_enemigos:
		cant_enemigos += 1
		var enemigo_scene = load("res://producto/assets/scenes/" + tipo_enemigo + ".tscn")
		var enemigo = enemigo_scene.instance()
		enemigo. position = posicion_aleatoria()
		get_node("/root/Mapa").add_child(enemigo)
		

func spawn_timer(tipo_enemigo: String, tiempo: int):
	var timer_enemigos = Timer.new()
	self.add_child(timer_enemigos)
	timer_enemigos.wait_time = tiempo
	timer_enemigos.connect("timeout", self, "spawn_enemigo",[tipo_enemigo])
	timer_enemigos.start()



func spawn_item_vida():
	var item = escena_item.instance()
	item.position = posicion_aleatoria()
	get_node("/root/Mapa").add_child(item)





func posicion_aleatoria() -> Vector2:
	var result
	if rand_range(0, 1)<=0.5:
		result=1
	else:
		result=-1
	var posx = jugador.position.x + rand_range(100, 800)*result #Inicia de 30 para que el enemigo no se genere muy cerca del jugador
	var posy = jugador.position.y + rand_range(30, 500)*result
	return Vector2(posx,posy)
	
	
>>>>>>> Stashed changes


func _process(_delta):
	pass

func _on_Jugador_player_defeated():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/MenuDerrota.tscn")
