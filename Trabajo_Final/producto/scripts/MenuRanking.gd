extends CanvasLayer

const SAVE_PATH = "res://Saves/saves.sav"
var highscores = null
var player = {
	"username":"",
	"score":0,
	"mapa": ""
}
var longitud = 13

func _ready():
	get_highscore_from_saves()
	##############################DESCOMENTAR CUANDO ESTE EL SERVIDOR####################_get_highscores_from_server()

func ordena(puntuaciones):
	var n = len(puntuaciones)
	for i in range(n):
		for j in range(0, n-i-1):
			if puntuaciones[j].score < puntuaciones[j+1].score:
				var aux = puntuaciones[j]
				puntuaciones[j] = puntuaciones[j+1]
				puntuaciones[j+1] = aux
	return puntuaciones

func genera_puntajes_random():
	randomize()
	var puntuaciones = Array()
	var mapas = get_parent().mapas
	var nombres = ["juan","pedro","sofia","miguel","claudia","maria","agustin","franco","nahuel","juliana"]
	for i in range(0,10):
		var jugador = {}
		jugador.username = nombres[i]
		jugador.score = randi()%1500+1
		jugador.mapa = mapas[randi()%mapas.size()]
		puntuaciones.append(jugador)
	var aux = ordena(puntuaciones)
	save_game(aux)

func genera_saves_vacio():
	var puntuaciones = []
	for _i in range(0,10):
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
	#print(highscores)
	save_game.close()

func get_highscore_from_saves():
	load_game()
	var nodo_nombre
	var nodo_score
	var nodo_mapa
	var nombre
	if highscores != null:
		for i in range(1,11):
			nodo_nombre = get_node("Frame_local/Nombres/Nombre"+ str(i))
			nodo_score = get_node("Frame_local/Puntajes/Puntaje"+str(i))
			nodo_mapa = get_node("Frame_local/Mapas/Mapa"+str(i))
			
			nombre = highscores[i-1].username
			if nombre.length() > longitud:
				nombre = nombre.substr(0,longitud)
			
			nodo_nombre.text = nombre
			nodo_score.text = str(highscores[i-1].score)
			nodo_mapa.text = str(highscores[i-1].mapa)

func _on_Generar_pressed():
	genera_puntajes_random()
	get_highscore_from_saves()

func _on_Button_pressed():
	genera_saves_vacio()
	get_highscore_from_saves()
	

###################PUNTAJE GLOBAL##################

#hay que actualizar el puntaje global con el atributo de mapa

func _get_highscores_from_server():
	var aux2 = Network.getHttp("")
	var highscores2 = aux2.split(";")
	var nodo_nombre
	var nodo_score
	var nodo_mapa
	var aux3
	print(aux2)
	
	for i in range(1,11):
		nodo_nombre = get_node("Frame_global/Nombres/Nombre"+ str(i))
		nodo_score = get_node("Frame_global/Puntajes/Puntaje"+str(i))
		nodo_mapa = get_node("Frame_global/Mapas/Mapa"+str(i))
		
		aux3 = highscores2[i-1].split("|")
		nodo_nombre.text = aux3[0]
		nodo_score.text = str(aux3[1])
		nodo_mapa.text = aux3[2]
	
	

func _on_Boton_salir_pressed():
	SoundManager.play_boton_1()
	self.queue_free()
