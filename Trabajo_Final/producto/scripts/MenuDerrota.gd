extends Control

onready var musica = get_node("AudioStreamPlayer2D")
onready var sprite = get_node("MarginContainer/GameOver")
var aux=0

var player = {
	"username" : "",
	"score" : ""
}

func _ready():
	musica.play()
	

func _process(_delta):
	yield(get_tree().create_timer(6.0), "timeout")
	if aux==0:
		musica.queue_free()
		aux=1

func _on_Menu_pressed():
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")


func _on_Salir_pressed():
	get_tree().quit()
