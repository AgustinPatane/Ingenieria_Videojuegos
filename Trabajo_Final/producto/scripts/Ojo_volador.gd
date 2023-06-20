extends "res://producto/scripts/Enemigo.gd"

onready var escena_proyectil = preload("res://producto/assets/scenes/MunicionEnemigo.tscn")

var tiempo_ultimo_disparo=0.0
var cadencia_disparo
var speed_shoot
var atrib = Atributos.get_ojo()

func _dispara(speed_shoot, range_shoot):
	var disparo = escena_proyectil.instance()
	disparo.direction = self.pos_jugador - $Position_arma.global_position
	disparo.global_position = $Position_arma.global_position
	disparo.rotation_degrees = disparo.direction.angle() * 180 / 3.141592
	disparo.set_damage(self.danio)
	disparo.set_rango(range_shoot)
	disparo.set_speed(speed_shoot)
	get_node("/root/"+Engine.get_meta("nombre_escena_mapa")).add_child(disparo)
	if verifica_pos():
		SoundManager.play_disparo_enemigo()
	tiempo_ultimo_disparo = OS.get_ticks_msec() / 1000.0

# funciona solo a veces
func verifica_pos():
	var camera_rect = Rect2(
		position.x - (OS.window_size.x / 2),
		position.y - (OS.window_size.y / 2),
		OS.window_size.x,
		OS.window_size.y
	)
	return camera_rect.has_point($Sprite.global_position)

func _ready():
	var mapa = get_node("/root/"+Engine.get_meta("nombre_escena_mapa"))
	mapa.connect("sube_dificultad_enemigos",self,"sube_dificultad")
	
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)
	cadencia_disparo = atrib.cadencia_disparo

func ataque():
	pass

func _process(_delta):
	var cond_disparo = tiempo_ultimo_disparo + cadencia_disparo <= OS.get_ticks_msec() / 1000.0
	if cond_disparo: 
		print(atrib.velocidad_disparo)
		_dispara(atrib.velocidad_disparo,atrib.rango_disparo)
	
func sube_dificultad():
	atrib.velocidad_disparo*=1.1
	atrib.rango_disparo+=0.5
	self.danio*=1.15
