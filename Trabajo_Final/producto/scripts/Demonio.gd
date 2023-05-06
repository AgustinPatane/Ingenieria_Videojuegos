extends "res://producto/scripts/Enemigo.gd"

func _ready():
	set_vida(200)
	set_danio(50)
	set_experiencia(100)
	set_puntos_muerte(50)
	set_speed(100)

func _process(_delta):
	pass
