extends Control

onready var musica = get_node("AudioStreamPlayer2D")
var aux=0
func _ready():
	musica.play()
	

func _process(delta):
	yield(get_tree().create_timer(6.0), "timeout")
	if aux==0:
		musica.queue_free()
		aux=1

func _on_Menu_pressed():
	get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")


func _on_Salir_pressed():
	get_tree().quit()
