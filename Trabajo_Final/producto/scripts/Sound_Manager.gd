extends Node

#Para crear un sonido unico (como el disparo):
#  1) Agregar escena hija "Sound_Queue" 
#  2) Ponerle un AudioStreamPlay como hijo
#  3) Settear el .wav al AudioStreamPlay
#  4) Hacer un sonidos.append(Sound queue nuevo) en el ready()
#  5) Agregar la funcion play para reproducir el sonido

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

var musica_reproduciendo = null

func _ready():
	sonidos.append(get_node("Disparo"))
	sonidos.append(get_node("Pasos")) #hay que eliminar este nodo
	sonidos.append(get_node("Boton_1"))
	sonidos.append(get_node("Congelar"))
	sonidos.append(get_node("Exp"))
	sonidos.append(get_node("Pisadas"))
	sonidos.append(get_node("Comprar"))
	sonidos.append(get_node("Espadazo"))
	sonidos.append(get_node("Mordida"))
	sonidos.append(get_node("Explosion_meteorito"))
	sonidos.append(get_node("Disparo_enemigo"))
	sonidos.append(get_node("Evolucion"))
	sonidos.append(get_node("Danio"))
	sonidos.append(get_node("Cohete"))
	
	musicas.append(get_node("Musica_menu"))
	musicas.append(get_node("Musica_partida"))
	musicas.append(get_node("Musica_derrota"))
	
	set_volumen_musica(Atributos.volumenes.default_vol_musica)
	set_volumen_sonido(Atributos.volumenes.default_vol_sonido)

func actualiza_volumenes():
	set_volumen_musica(Atributos.volumenes.default_vol_musica)
	set_volumen_sonido(Atributos.volumenes.default_vol_sonido)
	set_cond_musica(Atributos.volumenes.music_muted)
	set_cond_sonido(Atributos.volumenes.sound_muted)

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

func play_pisadas():
	var cond_pisada = tiempo_ultima_pisada + 0.4 <= OS.get_ticks_msec() / 1000.0
	if cond_sonido and cond_pisada:
		get_node("Pisadas").play_sound()
		tiempo_ultima_pisada = OS.get_ticks_msec() / 1000.0
		
# no va mas
func play_pasos():
	var cond_pisada = tiempo_ultima_pisada + 0.4 <= OS.get_ticks_msec() / 1000.0
	if cond_pisada and cond_sonido:
		#get_node("Pasos").play_random_sound()
		tiempo_ultima_pisada = OS.get_ticks_msec() / 1000.0

func set_musica_menu():
	musica_reproduciendo = get_node("Musica_menu")
	if cond_musica:
		play_musica()
	
func set_musica_partida():
	musica_reproduciendo = get_node("Musica_partida")
	if cond_musica:
		play_musica()

func set_musica_derrota():
	musica_reproduciendo = get_node("Musica_derrota")
	if cond_musica:
		play_musica()

func play_musica():
	if musica_reproduciendo != null:	
		musica_reproduciendo.play_sound()

func stop_musica():
	if musica_reproduciendo != null:	
		musica_reproduciendo.stop_sound()
		
func stop_musica_derrota():
	get_node("Musica_derrota").stop_sound()
	
func play_boton_1():
	if cond_sonido:
		get_node("Boton_1").play_sound()

func play_congelar():
	if cond_sonido:
		get_node("Congelar").play_sound()
		
func play_exp():
	if cond_sonido:
		get_node("Exp").play_sound()

func play_comprar():
	if cond_sonido:
		get_node("Comprar").play_sound()
		
func play_espadazo():
	if cond_sonido:
		get_node("Espadazo").play_sound()
		
func play_mordida():
	if cond_sonido:
		get_node("Mordida").play_sound()
	
func play_explosion_meteorito():
	if cond_sonido:
		get_node("Explosion_meteorito").play_sound()
		
func play_disparo_enemigo():
	if cond_sonido:
		get_node("Disparo_enemigo").play_sound()
	
func play_evolucion():
	if cond_sonido:
		get_node("Evolucion").play_sound()

func play_danio():
	if cond_sonido:
		get_node("Danio").play_sound()

func play_cohete():
	if cond_sonido:
		get_node("Cohete").play_sound()
