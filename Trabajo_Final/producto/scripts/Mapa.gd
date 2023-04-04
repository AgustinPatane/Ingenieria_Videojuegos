extends Node2D

export(int) var tiempo_spawn = 300
export(int) var tiempo_spawn_curita = 3000
var a = 0
onready var escena_enemigo = preload("res://producto/assets/scenes/Enemigo.tscn")
onready var escena_item = preload("res://producto/assets/scenes/Item.tscn")
var puntaje
var jugador
var arma
var vida
var balas
var barra_vida

func _ready():
	puntaje = get_node("/root/Mapa/Puntaje")
	jugador = get_node("/root/Mapa/Jugador")
	arma = get_node("/root/Mapa/Jugador/Arma")
	balas = get_node("/root/Mapa/Balas")
	barra_vida = get_node("/root/Mapa/BarraVida")
	randomize()

func spawn_enemigo():
	var posx = randi() % 1025
	var posy = randi() % 600
	var enemigo = escena_enemigo.instance()
	enemigo. position = Vector2(posx,posy)
	#get_tree().get_root().add_child(enemigo)
	get_node("/root/Mapa").add_child(enemigo)
	
	
func spawn_item_vida():
	var posx = randi() % 1025
	var posy = randi() % 600
	var item = escena_item.instance()
	item.position = Vector2(posx,posy)
	get_node("/root/Mapa").add_child(item)

func actualiza_vida():
	barra_vida.max_value = 100


func _process(_delta):
	if a%tiempo_spawn == 0:
		spawn_enemigo()
		
	if a%tiempo_spawn_curita == 0:
		spawn_item_vida()
	
	a+=1
	puntaje.text = "Puntaje:"+str(jugador.puntos)
	barra_vida.value = jugador.vida
	balas.text = str(arma.bullet_charger)
	
	actualiza_vida()


func _on_Jugador_player_defeated():
	get_tree().change_scene("res://producto/assets/scenes/MenuDerrota.tscn")





