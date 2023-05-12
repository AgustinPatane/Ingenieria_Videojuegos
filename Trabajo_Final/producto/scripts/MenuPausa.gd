extends CanvasLayer

signal continuar
var opacidad_fondo = 0.8
var jugador

# Called when the node enters the scene tree for the first time.
func _ready():
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
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")

func _on_Boton_musica_toggled(button_pressed):
	pass # Replace with function body.

func _on_Boton_sonido_toggled(button_pressed):
	pass # Replace with function body.

func _on_Boton_pantalla_completa_toggled(button_pressed):
	OS.set_window_fullscreen(button_pressed)
