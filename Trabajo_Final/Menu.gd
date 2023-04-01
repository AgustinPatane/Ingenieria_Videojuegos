extends Control

onready var musica = get_node("Musica_OnOff/Musica")

func _ready():
	musica.play()

func _on_Jugar_pressed():
	get_tree().change_scene("res://producto/assets/scenes/Mapa.tscn")

func _on_CheckButton_toggled(button_pressed):
	if (button_pressed):
		musica.play()
	else:
		musica.stop()
