extends CanvasLayer

signal continuar
var opacidad_fondo = 0.8
var jugador

# Called when the node enters the scene tree for the first time.
func _ready():
	$Musica/Slider_musica.max_value = Atributos.volumenes.max_vol
	$Musica/Slider_musica.min_value = Atributos.volumenes.min_vol
	$Musica/Slider_musica.value = Atributos.volumenes.default_vol_musica
	$Musica/Boton_musica.pressed = Atributos.volumenes.music_muted
	
	$Sonido/Slider_sonido.max_value = Atributos.volumenes.max_vol
	$Sonido/Slider_sonido.min_value = Atributos.volumenes.min_vol
	$Sonido/Slider_sonido.value = Atributos.volumenes.default_vol_sonido
	$Sonido/Boton_sonido.pressed = Atributos.volumenes.sound_muted
	
	$Boton_pantalla_completa.pressed = Atributos.fullscreen
	$Jugador/AnimationPlayer.play("idle")
	$Fondo_negro.set_modulate(Color(1,1,1,opacidad_fondo))

func cambia_skin():
	$Jugador/Skin_jugador.set_texture(jugador.skin_body)
	$Jugador/Skin_Arma.set_texture(jugador.skin_arma)
	$Stats/Control1/Vida.value = jugador.get_vida_max()
	$Stats/Control1/Vida.max_value = 300
	$Stats/Control2/Danio.value = jugador.get_danio_Arma()
	$Stats/Control2/Danio.max_value = 40
	$Stats/Control3/Velocidad.value = jugador.get_velocidad() / 1000
	$Stats/Control3/Velocidad.max_value = 40
	$Stats/Control4/Cadencia.value = 1/jugador.get_cadencia_disparo()
	$Stats/Control4/Cadencia.max_value = 1/0.1

func salir_pausa():
	get_tree().paused = false
	emit_signal("continuar")
	self.queue_free()

func _on_Boton_continuar_pressed():
	salir_pausa()

func _on_Boton_salir_pressed():
	get_tree().paused = false
	SoundManager.stop_musica()
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")

func _on_Boton_musica_toggled(button_pressed):
	Atributos.volumenes.music_muted = button_pressed
	SoundManager.set_cond_musica(button_pressed)

	if button_pressed:
		SoundManager.stop_musica()
	else:
		SoundManager.set_volumen_musica($Musica/Slider_musica.value)
		SoundManager.play_musica()
	
	Saves.guardar_config()

func _on_Boton_sonido_toggled(button_pressed):
	Atributos.volumenes.sound_muted = button_pressed
	SoundManager.set_cond_sonido(button_pressed)
	Saves.guardar_config()

func _on_Boton_pantalla_completa_toggled(button_pressed):
	Atributos.fullscreen = button_pressed
	OS.set_window_fullscreen(button_pressed)
	Saves.guardar_config()

func _on_Slider_sonido_value_changed(value):
	Atributos.volumenes.default_vol_sonido = value
	SoundManager.set_volumen_sonido(value)
	Saves.guardar_config()

func _on_Slider_musica_value_changed(value):
	Atributos.volumenes.default_vol_musica = value
	if !$Musica/Boton_musica.is_pressed():
		SoundManager.set_volumen_musica(value)
		Saves.guardar_config()
