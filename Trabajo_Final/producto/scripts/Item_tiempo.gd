extends "res://producto/scripts/Item.gd"


var recuperacion = 10

func _ready():
	pass 

func accion():
	jugador.recupera_tiempo(recuperacion)


