extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Marco/Musica/Slider_musica.max_value = Atributos.volumenes.max_vol
	$Marco/Musica/Slider_musica.min_value = Atributos.volumenes.min_vol
	$Marco/Musica/Slider_musica.value = Atributos.volumenes.default_vol_musica
	$Marco/Musica/Boton_musica.pressed = Atributos.volumenes.music_muted
	
	$Marco/Sonido/Slider_sonido.max_value = Atributos.volumenes.max_vol
	$Marco/Sonido/Slider_sonido.min_value = Atributos.volumenes.min_vol
	$Marco/Sonido/Slider_sonido.value = Atributos.volumenes.default_vol_sonido
	$Marco/Sonido/Boton_sonido.pressed = Atributos.volumenes.sound_muted
	
	$Marco/Boton_pantalla_completa.pressed = Atributos.fullscreen
	$Fondo_negro.set_modulate(Color(1,1,1,Atributos.opacidad_fondo))

func _on_Boton_salir_pressed():
	SoundManager.play_boton_1()
	self.queue_free()

func _on_Boton_pantalla_completa_toggled(button_pressed):
	SoundManager.play_boton_1()
	Atributos.fullscreen = button_pressed
	OS.set_window_fullscreen(button_pressed)
	Saves.guardar_config()

func _on_Boton_sonido_toggled(button_pressed):
	Atributos.volumenes.sound_muted = button_pressed
	SoundManager.set_cond_sonido(button_pressed)
	Saves.guardar_config()
	SoundManager.play_boton_1()


func _on_Slider_sonido_value_changed(value):
	Atributos.volumenes.default_vol_sonido = value
	SoundManager.set_volumen_sonido(value)
	Saves.guardar_config()


func _on_Slider_musica_value_changed(value):
	Atributos.volumenes.default_vol_musica = value
	if !$Marco/Musica/Boton_musica.is_pressed():
		SoundManager.set_volumen_musica(value)
		Saves.guardar_config()


func _on_Boton_musica_toggled(button_pressed):
	SoundManager.play_boton_1()
	Atributos.volumenes.music_muted = button_pressed
	SoundManager.set_cond_musica(button_pressed)

	if button_pressed:
		SoundManager.stop_musica()
	else:
		SoundManager.set_volumen_musica($Marco/Musica/Slider_musica.value)
		SoundManager.play_musica()
	
	Saves.guardar_config()
