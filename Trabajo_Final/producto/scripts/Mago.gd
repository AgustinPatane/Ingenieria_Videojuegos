extends "res://producto/scripts/Enemigo.gd"
onready var arma = preload("res://producto/scripts/Arma.gd")
onready var escena_proyectil = preload("res://producto/assets/scenes/MunicionEnemigo.tscn")
var tiempo_ultimo_disparo=0.0
var cadencia_disparo = 4



func _dispara():
	var disparo = escena_proyectil.instance()
	#$disparo.play()
	disparo.direction = self.pos_jugador - $Position_arma.global_position
	disparo.global_position = $Position_arma.global_position
	disparo.rotation_degrees = rotation_degrees
	disparo.set_damage(20)
	disparo.set_rango(4)
	get_tree().get_root().add_child(disparo)
	tiempo_ultimo_disparo = OS.get_ticks_msec() / 1000.0

func _ready():
	self.speed=50



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var cond_disparo = tiempo_ultimo_disparo + cadencia_disparo <= OS.get_ticks_msec() / 1000.0
	if cond_disparo: 
		_dispara()
