extends "res://producto/scripts/Enemigo.gd"

onready var escena_area_danio = preload("res://producto/assets/scenes/Area_hongo.tscn")


var tamanio_Area = 0.3
var max_tamanio
var tiempo_ultimo_disparo = 0.0
var area_danio

func _ready():
	var atrib = Atributos.get_hongo()
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)
	max_tamanio = atrib.max_tamanio
	
	area_danio = escena_area_danio.instance()
	area_danio.position = self.position
	area_danio.scale.x = tamanio_Area
	area_danio.scale.y = tamanio_Area
	area_danio.set_danio(danio)
	area_danio.ref_jugador(jugador)
	call_deferred("agrega_Area",area_danio)
	
func agrega_Area(_area_danio):
	get_node("/root/"+Engine.get_meta("nombre_escena_mapa")).add_child(_area_danio)
	
	var timer = Timer.new()
	timer.wait_time = 1.2
	self.add_child(timer)
	timer.connect("timeout", self, "aumenta_area")
	timer.start()

func aumenta_area():
	if tamanio_Area <= max_tamanio:
		tamanio_Area += 0.1
		area_danio.scale.x += tamanio_Area
		area_danio.scale.y += tamanio_Area

func drop_on_death():
	var orbe_exp = escena_exp.instance()
	orbe_exp.position = self.position
	orbe_exp._set_value(experiencia)
	get_parent().add_child(orbe_exp)
	area_danio.desaparecer()
	queue_free()

