extends Node2D

export(int) var tiempo_spawn_enemigo = 1
export(int) var tiempo_spawn_curita = 10
var max_enemigos = 50
var cant_enemigos = 0
onready var escena_enemigo = preload("res://producto/assets/scenes/Enemigo.tscn")
onready var escena_item = preload("res://producto/assets/scenes/Item.tscn")
var jugador

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


func _process(_delta):
	pass

func _on_Jugador_player_defeated():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/MenuDerrota.tscn")
