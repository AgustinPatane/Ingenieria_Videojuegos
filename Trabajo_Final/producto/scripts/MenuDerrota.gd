extends Control

const SAVE_PATH = "res://Saves/saves.sav"
onready var musica = get_node("AudioStreamPlayer2D")
onready var sprite = get_node("MarginContainer/GameOver")

var highscores = null
var aux=0

var player = {
	"username" : "",
	"score" : 0
}

func _ready():
	musica.play()
	load_game()
	player.score = Engine.get_meta("Puntaje")

func _process(_delta):
	yield(get_tree().create_timer(5.0), "timeout")
	if aux==0:
		musica.queue_free()
		aux=1

func genera_saves_vacio():
	var puntuaciones = []
	puntuaciones.append(player)
	for _i in range(1,10):
		var jugador = {}
		jugador.username = ""
		jugador.score = 0
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
	player.username = get_node("Nombre").text
	highscores.append(player)
	selecciona_diez()
	save_game(highscores)
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")

func _on_Salir_pressed():
	get_tree().quit()
