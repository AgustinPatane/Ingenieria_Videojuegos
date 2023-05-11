extends "res://producto/scripts/Enemigo.gd"

func _ready():
	var atrib = Atributos.get_gusano()
	
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)

func ataque():
	jugador.recibe_ataque(danio)

