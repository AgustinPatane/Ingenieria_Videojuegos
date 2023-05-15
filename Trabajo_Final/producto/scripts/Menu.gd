extends Control

onready var musica = get_node("Musica_OnOff/Musica")
onready var slider = get_node("VSlider")
onready var escena_mapa = preload("res://producto/assets/scenes/Mapa.tscn")
onready var escena_tienda = preload("res://producto/assets/scenes/Tienda.tscn")
onready var mini_mapa = get_node("Menu_previo/Mapas/FondoMapas")

var prev_volumen = -20
var ranking = null
var menu_ranking
var mapa_actual = 0
var cantidad_de_mapas = (countFilesInFolder("res://producto/assets/img/Mini_mapas/") - 2)/2

var registro_tienda = {
	"nombre":"",
	"valor":0
}
var lista_registro_tienda = Array()
var skins_compradas = Array()

const SAVE_PATH = "res://Saves/tienda.sav"

func _ready():
	print(cantidad_de_mapas)
	load_tienda()
	musica.play()
	slider.max_value = 5
	slider.min_value = -50
	slider.value = -30
	OS.set_window_position(Vector2(255,110))
	actualiza_minimapa()
	Engine.set_meta("arma_actual","arma_1")
	

func _on_Jugar_pressed():
	$Menu_previo.visible = true

func _on_CheckButton_toggled(button_pressed):
	if (button_pressed):
		slider.value = -49
		musica.play()
	else:
		slider.value = -50
		musica.stop()

func _on_Salir_pressed():
	get_tree().quit()
	
func _process(_delta):
	pass

func _on_VSlider_value_changed(value):
	if value == -50:
		get_node("Musica_OnOff").pressed = false
		musica.stop()
	elif prev_volumen == -50:
		get_node("Musica_OnOff").pressed = true
		musica.play()
	musica.volume_db = value
	prev_volumen = value
	
	
func _on_Ranking_pressed():
	if ranking == null:
		ranking = load("res://producto/assets/scenes/MenuRanking.tscn").instance()
		ranking.connect("continuar",self, "on_ranking_quit")

		self.add_child(ranking)
		menu_ranking = get_node("MenuRanking")
		menu_ranking.raise()
		#menu_ranking.rect_position = $Control/pos_pausa.position
		menu_ranking.rect_size = Vector2(2048,1200)
		get_tree().paused = true
	
func on_ranking_quit():
	ranking = null

func _on_Tienda_pressed():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Tienda.tscn")

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
	$Menu_previo.visible = false

func _on_btn_mapa_der_pressed():
	mapa_actual += 1
	if mapa_actual == cantidad_de_mapas :
		mapa_actual = 0
	actualiza_minimapa()

func _on_btn_mapa_izq_pressed():
	mapa_actual -= 1
	if mapa_actual < 0:
		mapa_actual = cantidad_de_mapas-1 
	actualiza_minimapa()

func actualiza_minimapa():
	get_node("Menu_previo/Mapas/FondoMapas/Mapa").texture = load("res://producto/assets/img/Mini_mapas/"+str(mapa_actual)+".png")
	if mapa_actual != cantidad_de_mapas-1:
		get_node("Menu_previo/Btn_ready").visible = true
	else:
		get_node("Menu_previo/Btn_ready").visible = false

func _on_modo_juego_1_pressed():
	pass # Replace with function body.


func _on_modo_juego_2_pressed():
	pass # Replace with function body.


func _on_Btn_ready_pressed():
	Engine.set_meta("numero_de_mapa",mapa_actual+1)
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Mapa.tscn")

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
