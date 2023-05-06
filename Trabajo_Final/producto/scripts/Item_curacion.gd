extends "res://producto/scripts/Item.gd"

var recuperacion = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func accion():
	jugador.recupera_vida(recuperacion)
