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
	if cant_enemigos < max_enemigos:
		cant_enemigos += 1
		spawn(escena_enemigo.instance())

func spawn_item_vida():
	spawn(escena_item.instance())

#le pasas una instancia de una escena y la posiciona dentro de los limites del mapa
func spawn(instancia):
	var result
	if rand_range(0, 1)<=0.5:
		result=1
	else:
		result=-1	
	var posx = rand_range(-567,1651)
	var posy = rand_range(-411,980)
	if abs(posx) - abs(jugador.position.x) < 20 and abs(posy) - abs(jugador.position.y) < 20:
		posx += 20 * result 
		posy += 20 * result
	instancia.position = Vector2(posx,posy)
	get_node("/root/Mapa").add_child(instancia)
	
func _process(_delta):
	pass

func _on_Jugador_player_defeated():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/MenuDerrota.tscn")
