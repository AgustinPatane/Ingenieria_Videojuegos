extends Control

onready var musica = get_node("Musica_OnOff/Musica")
onready var slider = get_node("VSlider")

var prev_volumen = -20

func _ready():
	musica.play()
	OS.set_window_position(Vector2(255,110))
	#OS.set_window_position(OS.get_window_position() + OS.get_screen_size() / 2)
	#OS.set_window_maximized(true)

func _on_Jugar_pressed():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Mapa.tscn")

func _on_CheckButton_toggled(button_pressed):
	if (button_pressed):
		slider.value = -49
		musica.play()
	else:
		slider.value = -50
		musica.stop()


func _on_Salir_pressed():
	get_tree().quit()
	
func _process(_delta):
	pass


func _on_VSlider_value_changed(value):
	if value == -50:
		get_node("Musica_OnOff").pressed = false
		musica.stop()
	elif prev_volumen == -50:
		get_node("Musica_OnOff").pressed = true
		musica.play()
	musica.volume_db = value
	prev_volumen = value
	
