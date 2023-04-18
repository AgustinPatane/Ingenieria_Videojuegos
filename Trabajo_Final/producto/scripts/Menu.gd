extends Control

onready var musica = get_node("Musica_OnOff/Musica")
onready var slider = get_node("VSlider")
onready var escena_mapa = preload("res://producto/assets/scenes/Mapa.tscn")
onready var escena_tienda = preload("res://producto/assets/scenes/Tienda.tscn")

var prev_volumen = -20
var ranking = null
var menu_ranking

const SAVE_PATH = "res://Saves/tienda.sav"

func _ready():
	if !Engine.has_meta("ruta_skin"):
		Engine.set_meta("ruta_skin","res://producto/assets/img/jugador/skins/Yellow")
	musica.play()
	slider.max_value = 5
	slider.min_value = -50
	slider.value = -30
	OS.set_window_position(Vector2(255,110))
	#OS.set_fullscreen(true)
	#OS.set_window_maximized(true)
	load_tienda()

func _on_Jugar_pressed():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Mapa.tscn")

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
		file.open(SAVE_PATH, File.READ)
		var monedas_tienda = file.get_as_text()
		Engine.set_meta("monedas",int(monedas_tienda))
		file.close()
