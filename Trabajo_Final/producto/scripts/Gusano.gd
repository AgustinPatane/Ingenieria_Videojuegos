extends "res://producto/scripts/Enemigo.gd"


var atrib = Atributos.get_gusano()
func _ready():
	randomize()
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)
	
	$Sprite.texture = load("res://producto/assets/img/enemigos/Gusano/"+str(round(rand_range(0.5, 0.5+atrib.cantidad)))+".png")

	var mapa = get_node("/root/"+Engine.get_meta("nombre_escena_mapa"))
	mapa.connect("sube_dificultad_enemigos",self,"sube_dificultad")

func ataque():
	SoundManager.play_mordida()
	jugador.recibe_ataque(danio)


func sube_dificultad():
	self.danio*=1.15
	self.speed=1.1
