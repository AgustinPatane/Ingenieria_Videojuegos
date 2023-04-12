extends Control

onready var puntos = get_node("Puntos")
var puntos_jugador = 10000

func _ready():
	puntos.text = str(puntos_jugador)

func _process(delta):
	pass
