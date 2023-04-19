extends Control

var monedas
var skins_disponibles = Array()
var skins_compradas = Array()
var skin_equipada
var skin_seleccionada = "Pela"

var skins_armas = Array()

onready var label_monedas = get_node("Monedas")
onready var valor = get_node("skins_jugador/valor")
onready var botones_skins_jugador = get_node("skins_jugador")

const SAVE_PATH = "res://Saves/tienda.sav"

func _ready():
	monedas = Engine.get_meta("monedas")
	if monedas == null:
		monedas = 1300
	label_monedas.text = str(monedas)
	print(monedas)
	var boton = botones_skins_jugador.get_node(skin_seleccionada)
	print(boton.pressed)
	boton.texture_normal = boton.texture_pressed

func _on_comprar_pressed():
	var costo = int(valor.text)
	if monedas>=costo:
		if skins_compradas.has(skin_seleccionada):
			print("No se puede, ya la compraste")
		else:
			monedas-=costo
			label_monedas.text = str(monedas)
			skins_compradas.append(skin_seleccionada)
			var boton = botones_skins_jugador.get_node(skin_seleccionada)	
			boton.texture_normal = boton.texture_pressed
			print(skins_compradas)
			guardar_monedas()
	else:
		pass #mostrar monedas insuficientes

func _on_skin_pela_pressed():
	valor.text = "100"
	skin_seleccionada = "Pela"

func _on_skin_soldado_pressed():
	valor.text = "200"
	skin_seleccionada = "Soldado_arg"

func _on_skin_bask_pressed():
	valor.text = "300"
	skin_seleccionada = "Nba"

func _on_skin_rambo_pressed():
	valor.text = "500"
	skin_seleccionada = "Rambo"

func _on_volver_a_menu_pressed():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")

func _on_equipar_pressed():
	if skins_compradas.has(skin_seleccionada):
		var ruta = "res://producto/assets/img/jugador/skins/" + skin_seleccionada
		Engine.set_meta("ruta_skin",ruta)
	pass

func guardar_monedas():
	var file = File.new()
	file.open(SAVE_PATH, File.WRITE)
	file.store_line(str(monedas))
	file.close()
