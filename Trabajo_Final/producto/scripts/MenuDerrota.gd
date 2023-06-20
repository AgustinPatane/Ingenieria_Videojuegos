extends Control

onready var sprite = get_node("GameOver")

var highserver
var highscores = null
var aux=0

var player = {
	"username" : "",
	"score" : 0,
}
		
func _ready():
	Atributos.set_cursor_menu()
	#SoundManager.play_musica_derrota()
	load_game()
	if Engine.has_meta("Puntaje") and Engine.has_meta("Mapa"):
		player.score = Engine.get_meta("Puntaje")
		player.mapa = Engine.get_meta("Mapa")

func _process(_delta):
	pass

func genera_saves_vacio():
	var puntuaciones = []
	puntuaciones.append(player)
	for _i in range(1,10):
		var jugador = {}
		jugador.username = "|"
		jugador.score = 0
		jugador.mapa = ""
		puntuaciones.append(jugador)
	save_game(puntuaciones)

func save_game(data):
	var save_game = File.new()
	save_game.open(Atributos.ruta_saves, File.WRITE)
	save_game.store_line(to_json(data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if !save_game.file_exists(Atributos.ruta_saves):
		genera_saves_vacio()
	save_game.open(Atributos.ruta_saves, File.READ)
	highscores = parse_json(save_game.get_line())
	save_game.close()

func selecciona_diez():
	var n = len(highscores)
	for i in range(n):
		for j in range(0, n-i-1):
			if highscores[j].score < highscores[j+1].score:
				var puntajes_aux = highscores[j]
				highscores[j] = highscores[j+1]
				highscores[j+1] = puntajes_aux
	highscores.remove(highscores.size() - 1)

func guardar():
	SoundManager.stop_musica_derrota()
	player.username = get_node("Nombre").text+"|"+Engine.get_meta("nombre_escena_mapa")
	highscores.append(player)
	selecciona_diez()
	save_game(highscores)
	Network.postHttp(player)


func _on_Menu_pressed():
	guardar()
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")
	

func _on_Salir_pressed():
	#guardar()
	get_tree().quit()

func _on_Btn_Menu_pressed():
	guardar()
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")


func _on_Btn_Salir_pressed():
	#guardar()
	get_tree().quit()
