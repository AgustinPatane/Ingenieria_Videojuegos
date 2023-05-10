extends "res://producto/scripts/Enemigo.gd"

var tamanio_Area = 0
var max_tamanio = 4
var tiempo_ultimo_disparo = 0.0

func _ready():
	var atrib = Atributos.get_hongo()
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)

func disparar():
	#var disparo = escena_proyectil.instance()
	#$disparo.play()
	#disparo.set_damage(self.danio)
	#disparo.set_rango(4)
	#disparo.set_speed(300)
	#get_node("/root/Mapa").add_child(disparo)
	tiempo_ultimo_disparo = OS.get_ticks_msec() / 1000.0

func ataque():
	#jugador.recibe_ataque(danio)
	pass

func _process(_delta):
	if !flag_tocando_player:
		if pos_jugador.x < position.x:
			self.scale.x = abs(self.scale.x)
		else:
			self.scale.x = abs(self.scale.x) * -1
