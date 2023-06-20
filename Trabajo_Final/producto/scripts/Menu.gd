extends Control

onready var escena_mapa = preload("res://producto/assets/scenes/Mapa.tscn")
onready var escena_tienda = preload("res://producto/assets/scenes/Tienda.tscn")
onready var escena_config = preload("res://producto/assets/scenes/Configuraciones.tscn")
onready var escena_ranking = preload("res://producto/assets/scenes/MenuRanking.tscn")
onready var escena_controles = preload("res://producto/assets/scenes/Menu_Controles.tscn")
onready var mini_mapa = get_node("Menu_previo/Mapas/FondoMapas")

onready var btn_normal = get_node("Menu_previo/modo_Normal")
onready var btn_contrarreloj = get_node("Menu_previo/modo_Contrarreloj")

var prev_volumen = -20
var mapa_actual = 0
var opacidad_fondo_meteorito = 0

var mapas = ["MapaDungeon","MapaLuna","MapaLava","MapaMadera","MapaArcilla","MapaIsla"]
var cantidad_de_mapas = mapas.size()


var registro_tienda = {
	"nombre":"",
	"valor":0
}
var lista_registro_tienda = Array()
var skins_compradas = Array()
var meteorito = false

const SAVE_PATH = "res://Saves/tienda.sav"

var config = {
	fullscreen = false,
	vol_sonido = 0,
	vol_musica = 0,
	sound_muted = false,
	music_muted = false
}

signal meteorito_boom 
var explotando = false

func _ready():
	var _a = self.connect("meteorito_boom",self,"explotar")
	Atributos.set_cursor_menu()
	Engine.set_meta("contrarreloj",false)
	btn_contrarreloj.disabled = false
	btn_normal.disabled = true
	Saves.cargar_config()
	SoundManager.set_musica_menu()
	load_tienda()
	OS.set_window_position(Atributos.posicion)
	OS.set_window_size(Atributos.tamanio)
	actualiza_minimapa()
	Engine.set_meta("arma_actual","arma_1")
	$Meteorito/Sprite.position.x = 20
	$Meteorito/Sprite.position.y = 11
	$Meteorito.visible = false
	

func _on_Jugar_pressed():
	SoundManager.play_boton_1()
	$Menu_previo.visible = true

func _on_Salir_pressed():
	SoundManager.play_boton_1()
	get_tree().quit()

func _on_Ranking_pressed():
	SoundManager.play_boton_1()
	var ranking = escena_ranking.instance()
	self.add_child(ranking)

func _on_Tienda_pressed():
	SoundManager.play_boton_1()
	var ranking = escena_tienda.instance()
	self.add_child(ranking)
	
	#var _aux = get_tree().change_scene("res://producto/assets/scenes/Tienda.tscn")

func load_tienda():
	var file = File.new()
	if file.file_exists(SAVE_PATH):
		file.open(SAVE_PATH,File.READ)
		var skins_cargados = parse_json(file.get_line())
		Engine.set_meta("ruta_skin","res://producto/assets/img/jugador/skins/"+skins_cargados[0].nombre)
		Engine.set_meta("skin_equipado",skins_cargados[0].nombre)
		Engine.set_meta("monedas",skins_cargados[0].valor)
		for i in range(1,len(skins_cargados)):
			if skins_cargados[i].valor == 1:
				skins_compradas.append(skins_cargados[i])#agrega los skins comprados
	else:
		pass
	file.close()


func _on_btn_volver_pressed():
	SoundManager.play_boton_1()
	$Menu_previo.visible = false

func _on_btn_mapa_der_pressed():
	SoundManager.play_boton_1()
	mapa_actual += 1
	if mapa_actual == cantidad_de_mapas :
		mapa_actual = 0
	actualiza_minimapa()

func _on_btn_mapa_izq_pressed():
	SoundManager.play_boton_1()
	mapa_actual -= 1
	if mapa_actual < 0:
		mapa_actual = cantidad_de_mapas-1 
	actualiza_minimapa()

func actualiza_minimapa():
	get_node("Menu_previo/Mapas/FondoMapas/Mapa").texture = load("res://producto/assets/img/Mini_mapas/"+str(mapa_actual)+".png")
	get_node("Menu_previo/Btn_ready").visible = true
	
func _on_Btn_ready_pressed():
	SoundManager.play_boton_1()
	$Meteorito.visible = true
	$Meteorito/AnimationPlayer.play("movimiento")
	meteorito = true
	
	
func _process(_delta):
	if meteorito:
		opacidad_fondo_meteorito += 0.02
		$Meteorito.modulate = Color(1,1,1,opacidad_fondo_meteorito)
		
		$Meteorito/Sprite.position.x += 10
		$Meteorito/Sprite.position.y += 13
		$Meteorito/Sprite.scale.x += 0.1
		$Meteorito/Sprite.scale.y -= 0.1
		
		if $Meteorito/Sprite.position.x > 500 and !explotando:
			emit_signal("meteorito_boom")
			explotando = true
			
	if explotando:
		$Explosion/Sprite.scale.x += 0.1
		$Explosion/Sprite.scale.y += 0.1
		$Explosion/Sprite.position.y -=7

func explotar():
	SoundManager.play_explosion_meteorito()
	$Explosion.visible = true
	$Meteorito/Sprite.visible = false
	$Explosion/Anim_Explosion.play("boom")
	

func _on_Explosion_animation_finished(_anim_name):
	Engine.set_meta("nombre_escena_mapa",mapas[mapa_actual])
	SoundManager.stop_musica()
	var _aux = get_tree().change_scene("res://producto/assets/scenes/"+mapas[mapa_actual]+".tscn")

func countFilesInFolder(folder_path):
	var dir = Directory.new()
	var file_count = 0

	if dir.open(folder_path) == OK:
		dir.list_dir_begin()
		while true:
			var file = dir.get_next()
			if file == "":
				break
			file_count += 1
		dir.list_dir_end()
	return file_count


func guardar_config():
	var save_config = File.new()
	save_config.open("res://Saves/config.sav", File.WRITE)
	save_config.store_line(to_json(config))
	save_config.close()
	
func cargar_config():
	var save_config = File.new()
	if not save_config.file_exists("res://Saves/config.sav"):
		guardar_config()
		return # Error! No hay archivo que guardar
	save_config.open("res://Saves/config.sav", File.READ)
	config = parse_json(save_config.get_line())
	save_config.close()


func _on_Empezar_pressed():
	SoundManager.play_boton_1()
	$Menu_previo.visible = true

func _on_Ayuda_pressed():
	SoundManager.play_boton_1()
	var controles = escena_controles.instance()
	self.add_child(controles)

func _on_Configuracion_pressed():
	SoundManager.play_boton_1()
	var configuracion = escena_config.instance()
	self.add_child(configuracion)


func _on_modo_Normal_toggled(_button_pressed):
	SoundManager.play_boton_1()
	Engine.set_meta("contrarreloj",false)
	
	btn_contrarreloj.disabled = false
	btn_normal.disabled = true
	btn_contrarreloj.set_pressed(false)


func _on_modo_Contrarreloj_toggled(_button_pressed):
	SoundManager.play_boton_1()
	Engine.set_meta("contrarreloj",true)
	btn_contrarreloj.disabled = true
	btn_normal.disabled = false
	btn_normal.set_pressed(false)



