extends Node

#Para crear un sonido unico (como el disparo):
#  1) Agregar escena hija "Sound_Queue" 
#  2) Ponerle un AudioStreamPlay como hijo
#  3) Settear el .wav al AudioStreamPlay

#Para crear sonidos aleatorios (como los pasos):
#  1) Agregar una escena hija "Sound_Pool"
#  1) Ponerle tantas escenas hijas "Sound_Queue", como audios diferentes se tengan
#  2) Ponerle un AudioStreamPlay como hijo
#  3) Settear el .wav al AudioStreamPlay

#var singleton_instance
var tiempo_ultima_pisada = 0
var volumen_sonido = Atributos.volumenes.default_vol_sonido
var volumen_musica = Atributos.volumenes.default_vol_musica
var cond_sonido = true
var cond_musica = true

var sonidos = []
var musicas = []

func _ready():
	sonidos.append(get_node("Disparo"))
	sonidos.append(get_node("Pasos"))
	
	musicas.append(get_node("Musica_menu"))
	musicas.append(get_node("Musica_partida"))
	musicas.append(get_node("Musica_derrota"))
	
	set_volumen_musica(Atributos.volumenes.default_vol_musica)
	set_volumen_sonido(Atributos.volumenes.default_vol_sonido)
	pass

func set_volumen_sonido(val):
	volumen_sonido = val
	for i in range(sonidos.size()):
		sonidos[i].set_volumen(val)
	
func set_volumen_musica(val):
	volumen_musica = val
	for i in range(musicas.size()):
		musicas[i].set_volumen(val)

func set_cond_musica(val):
	cond_musica = !val

func set_cond_sonido(val):
	cond_sonido = !val

func play_disparo():
	if cond_sonido:
		get_node("Disparo").play_sound()

func play_pasos():
	var cond_pisada = tiempo_ultima_pisada + 0.4 <= OS.get_ticks_msec() / 1000.0
	if cond_pisada and cond_sonido:
		get_node("Pasos").play_random_sound()
		tiempo_ultima_pisada = OS.get_ticks_msec() / 1000.0

func play_musica_menu():
	get_node("Musica_menu").play_sound()
	
func stop_musica_menu():
	get_node("Musica_menu").stop_sound()

func play_musica_partida():
	get_node("Musica_partida").play_sound()
	
func stop_musica_partida():
	get_node("Musica_partida").stop_sound()

func play_musica_derrota():
	get_node("Musica_derrota").play_sound()

func stop_musica_derrota():
	get_node("Musica_derrota").stop_sound()
	

