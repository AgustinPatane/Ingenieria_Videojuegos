extends Control

const SAVE_PATH = "res://Saves/saves.sav"
signal continuar
var highscores = null
var player = {
	"username":"",
	"score":0
}

func acomoda_todo():
	get_node("Ranking_Local/LineEdit").set_editable(false)
	get_node("Ranking_Mundial/LineEdit").set_editable(false)
	#la idea de esto seria acomodar donde aparecen los nombres y puntuaciones porque se aparecen medio raro
	pass

func _ready():
	acomoda_todo()
	#_genera_puntajes_random()
	_get_highscore_from_saves()

func _on_Volver_button_down():
	get_tree().paused = false
	emit_signal("continuar")
	self.queue_free()

func ordena(puntuaciones):
	var n = len(puntuaciones)
	for i in range(n):
		for j in range(0, n-i-1):
			if puntuaciones[j].score < puntuaciones[j+1].score:
				var aux = puntuaciones[j]
				puntuaciones[j] = puntuaciones[j+1]
				puntuaciones[j+1] = aux
	return puntuaciones

func _genera_puntajes_random():
	randomize()
	var puntuaciones = Array()
	var nombres = ["juan","pedro","sofia","miguel","claudia","maria","agustin","franco","nahuel","juliana"]
	for i in range(0,10):
		var jugador = {}
		jugador.username = nombres[i]
		jugador.score = randi()%1000+1
		puntuaciones.append(jugador)
	var aux = ordena(puntuaciones)
	print(aux)
	save_game(aux)

func genera_saves_vacio():
	var puntuaciones = []
	for _i in range(0,10):
		var jugador = {}
		jugador.username = ""
		jugador.score = ""
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

func _get_highscore_from_saves():
	load_game()
	if highscores != null:
		for i in range(1,11):
			var nodo_nombre = get_node("Ranking_Local/HBoxContainer/Nombres/Nombre" + str(i))
			var nodo_score = get_node("Ranking_Local/HBoxContainer/Scores/Score" + str(i))
			nodo_nombre.text = highscores[i-1].username
			nodo_nombre.set_editable(false)
			nodo_score.text = str(highscores[i-1].score)
			nodo_score.set_editable(false)

func _on_Borrar_button_down():
	genera_saves_vacio()
	_get_highscore_from_saves()

func _on_Generar_button_down():
	_genera_puntajes_random()
	_get_highscore_from_saves()
