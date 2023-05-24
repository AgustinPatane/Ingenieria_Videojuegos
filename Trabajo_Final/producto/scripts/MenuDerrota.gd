extends Control

const SAVE_PATH = "res://Saves/saves.sav"
onready var sprite = get_node("GameOver")

var highserver
var highscores = null
var aux=0

var player = {
	"username" : "",
	"score" : 0,
	"mapa": ""
}
		
func _ready():
	#SoundManager.play_musica_derrota()
	load_game()
	player.score = Engine.get_meta("Puntaje")
	player.mapa = Engine.get_meta("Mapa")

func _process(_delta):
	pass

func genera_saves_vacio():
	var puntuaciones = []
	puntuaciones.append(player)
	for _i in range(1,10):
		var jugador = {}
		jugador.username = ""
		jugador.score = 0
		jugador.mapa = ""
		puntuaciones.append(jugador)
	save_game(puntuaciones)

func save_game(data):
	var save_game = File.new()
	save_game.open(SAVE_PATH, File.WRITE)
	save_game.store_line(to_json(data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists(SAVE_PATH):
		genera_saves_vacio()
	save_game.open(SAVE_PATH, File.READ)
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

func _on_Menu_pressed():
	SoundManager.stop_musica_derrota()
	player.username = get_node("Nombre").text
	highscores.append(player)
	selecciona_diez()
	save_game(highscores)
	
	

	##############################DESCOMENTAR CUANDO ESTE EL SERVIDOR####################Network.postHttp(player)
	
	
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")
	
	

func _on_Salir_pressed():
	get_tree().quit()




