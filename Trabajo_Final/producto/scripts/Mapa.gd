extends Node2D

export(int) var tiempo_spawn_enemigo = 2
export(int) var tiempo_spawn_curita = 1
var max_enemigos = 30
var cant_enemigos = 0
onready var escena_enemigo = preload("res://producto/assets/scenes/Enemigo.tscn")
onready var escena_item = preload("res://producto/assets/scenes/Item.tscn")
var jugador





func _ready():
	jugador = get_node("Jugador")
	randomize()
	
	
	var timer_objetos = Timer.new()
	self.add_child(timer_objetos)
	timer_objetos.wait_time = tiempo_spawn_curita
	timer_objetos.connect("timeout", self, "spawn_item_vida")
	timer_objetos.start()
	
	
	var timer_enemigos = Timer.new()
	self.add_child(timer_enemigos)
	timer_enemigos.wait_time = tiempo_spawn_enemigo
	timer_enemigos.connect("timeout", self, "spawn_enemigo")
	timer_enemigos.start()
	
	

	
func spawn_enemigo():
	#print("BBBBBBBBBB")
	var result
	if cant_enemigos < max_enemigos:
		cant_enemigos += 1
		if rand_range(0, 1)<=0.5:
			result=1
		else:
			result=-1
		var posx = jugador.position.x + rand_range(100, 800)*result #Inicia de 30 para que el enemigo no se genere muy cerca del jugador
		var posy = jugador.position.y + rand_range(30, 500)*result
		var enemigo = escena_enemigo.instance()
		enemigo. position = Vector2(posx,posy)
		get_node("/root/Mapa").add_child(enemigo)
		#print(cant_enemigos)
	
func spawn_item_vida():
	#print("AAAAAAAAA")
	var posx = jugador.position.x + rand_range(-800, 800)
	var posy = jugador.position.y + rand_range(-500, 500)
	var item = escena_item.instance()
	item.position = Vector2(posx,posy)
	get_node("/root/Mapa").add_child(item)
	

func _process(_delta):
	pass

func _on_Jugador_player_defeated():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/MenuDerrota.tscn")
