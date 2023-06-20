extends CanvasLayer

var monedas
var skins_cargados = Array()
var skins_compradas = Array()
var skin_equipada
var skin_seleccionada = ""

var skins_armas = Array()

onready var escena_monedas = preload("res://producto/assets/scenes/Monedas_Insuficientes.tscn")

onready var label_monedas = get_node("Monedas")
onready var valor = get_node("skins_jugador/valor")
onready var botones = get_node("skins_jugador")

onready var skins_colores = get_node("skins_jugador/skins_de_colores")
var lista_skins_colores = ["Yellow","Red","Blue","Black"]
onready var skins_customs = get_node("skins_jugador/skins_customs")
var lista_skins_customs = ["Pela","Soldado-arg","Nba","Rambo"]

const SAVE_PATH = "res://Saves/tienda.sav"

func _ready():
	load_tienda()

func _on_comprar_pressed():
	var costo
	if valor.text == "":
		costo = 0
	else: 
		costo = int(valor.text)
	if !(skins_compradas.has(skin_seleccionada)) and skin_seleccionada != "":
		if monedas>=costo:
			SoundManager.play_comprar()
			monedas-=costo
			label_monedas.text = str(monedas)
			skins_compradas.append(skin_seleccionada)
			var boton
			if lista_skins_colores.has(skin_seleccionada):
				boton = skins_colores.get_node(skin_seleccionada)
			else:
				if lista_skins_customs.has(skin_seleccionada):
					boton = skins_customs.get_node(skin_seleccionada)
				else:
					pass
			print(lista_skins_customs)
			boton.texture_normal = boton.texture_pressed
			
			for i in range(0,len(skins_cargados)):
				if skins_cargados[i].nombre==skin_seleccionada:
					skins_cargados[i].valor = 1
			
			guardar_tienda()
		# monedas insuficientes
		else:
			SoundManager.play_boton_1()
			var _monedas = escena_monedas.instance()
			self.add_child(_monedas)
	# ya se tiene la skin o no se seleccionó ninguna
	else:
		SoundManager.play_boton_1()

func _on_skin_pela_pressed():
	SoundManager.play_boton_1()
	valor.text = "15000"
	skin_seleccionada = "Pela"

func _on_skin_soldado_pressed():
	SoundManager.play_boton_1()
	valor.text = "20000"
	skin_seleccionada = "Soldado_arg"

func _on_skin_bask_pressed():
	SoundManager.play_boton_1()
	valor.text = "70000"
	skin_seleccionada = "Nba"

func _on_skin_rambo_pressed():
	SoundManager.play_boton_1()
	valor.text = "40000"
	skin_seleccionada = "Rambo"

func _on_Yellow_pressed():
	SoundManager.play_boton_1()
	valor.text = "0"
	skin_seleccionada = "Yellow"

func _on_Red_pressed():
	SoundManager.play_boton_1()
	valor.text = "7000"
	skin_seleccionada = "Red"

func _on_Blue_pressed():
	SoundManager.play_boton_1()
	valor.text = "7000"
	skin_seleccionada = "Blue"

func _on_Black_pressed():
	SoundManager.play_boton_1()
	valor.text = "10000"
	skin_seleccionada = "Black"

func _on_volver_a_menu_pressed():
	SoundManager.play_boton_1()
	queue_free()
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")

func _on_equipar_pressed():
	SoundManager.play_boton_1()
	if skins_compradas.has(skin_seleccionada):
		var ruta = "res://producto/assets/img/jugador/skins/" + skin_seleccionada
		Engine.set_meta("ruta_skin",ruta)
		Engine.set_meta("skin_equipado",skin_seleccionada)
		guardar_tienda()
	pass

func guardar_tienda():
	var file = File.new()
	
	file.open(SAVE_PATH,File.READ)
	var _skins_cargados2 = parse_json(file.get_line())

	skins_cargados[0].nombre = Engine.get_meta("skin_equipado")
	skins_cargados[0].valor = Engine.get_meta("monedas")
	file.close()
	
	file.open(SAVE_PATH, File.WRITE)
	file.store_line(to_json(skins_cargados))
	file.close()


func load_tienda():
	var _auxruta = ""
	var file = File.new()
	file.open(SAVE_PATH,File.READ)
	skins_cargados = parse_json(file.get_line())
	for i in range(0,len(skins_cargados)):
		if skins_cargados[i].valor == 1:
			skins_compradas.append(skins_cargados[i].nombre)	
			if skins_cargados[i].tipo == "color":
				var boton1 = skins_colores.get_node(skins_cargados[i].nombre)
				boton1.texture_normal = boton1.texture_pressed
			else: 
				if skins_cargados[i].tipo == "custom":
					var boton2 = skins_customs.get_node(skins_cargados[i].nombre)
					boton2.texture_normal = boton2.texture_pressed
				else:
					pass
	monedas = Engine.get_meta("monedas")
	if monedas == null:
		monedas = 99999
	label_monedas.text = str(monedas)


func _on_ver_skins_colores_pressed():
	SoundManager.play_boton_1()
	skins_colores.visible = true
	skins_customs.visible = false

func _on_ver_skins_customs_pressed():
	SoundManager.play_boton_1()
	skins_colores.visible = false
	skins_customs.visible = true



func _on_Boton_salir_pressed():
	SoundManager.play_boton_1()
	self.queue_free()

func _on_Izquierda_pressed():
	SoundManager.play_boton_1()
	skins_colores.visible = false
	skins_customs.visible = true

func _on_Derecha_pressed():
	SoundManager.play_boton_1()
	skins_colores.visible = true
	skins_customs.visible = false
