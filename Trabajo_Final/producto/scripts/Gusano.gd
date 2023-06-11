extends "res://producto/scripts/Enemigo.gd"

func _ready():
	randomize()
	var atrib = Atributos.get_gusano()
	
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)
	
	$Sprite.texture = load("res://producto/assets/img/enemigos/Gusano/"+str(round(rand_range(0.5, 0.5+atrib.cantidad)))+".png")



func ataque():
	SoundManager.play_mordida()
	jugador.recibe_ataque(danio)

