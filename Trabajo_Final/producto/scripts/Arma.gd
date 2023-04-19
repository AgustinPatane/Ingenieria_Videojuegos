extends Node2D

var mouse_position
var cadencia_disparo = 0.4 #es en segundos
var tiempo_ultimo_disparo = 0.0
var damage_Arma = 10.0
var rango = 0.5 #tiempo de vida del disparo
var velocidad_proyectil = 800
var cant_atraviesa = 1
var cant_proyectiles = 1
var dispersion_angular = 0

onready var escena_proyectil = preload("res://producto/assets/scenes/Proyectil.tscn")

func _ready():
	pass

# -------------------------------------------------------------------------------------
# --------------------------------- DISPARO ARMA --------------------------------------
# -------------------------------------------------------------------------------------

func _dispara():
	#$disparo.play()
	for _i in range(cant_proyectiles):
		var dispersion = rand_range(-dispersion_angular, dispersion_angular)
		var disparo = escena_proyectil.instance()
		var direccion = mouse_position - $Position_arma.global_position
		disparo.direction = direccion.rotated(dispersion * 3.141592 / 180)
		disparo.global_position = $Position_arma.global_position
		disparo.rotation_degrees = rotation_degrees + dispersion
		disparo.set_damage(damage_Arma)
		disparo.set_rango(rango)
		disparo.set_atraviesa(cant_atraviesa)
		get_tree().get_root().add_child(disparo)
	tiempo_ultimo_disparo = OS.get_ticks_msec() / 1000.0
	
func _process(_delta):
	var cond_disparo = tiempo_ultimo_disparo + cadencia_disparo <= OS.get_ticks_msec() / 1000.0
	if Input.is_action_pressed("shoot") and cond_disparo: 
		_dispara()

# -------------------------------------------------------------------------------------
# --------------------------------- MOVIMIENTO ARMA -----------------------------------
# -------------------------------------------------------------------------------------

func _physics_process(_delta):
	_mira_mouse(self)
	if(rotation_degrees > 360):	rotation_degrees -=360
	elif(rotation_degrees < 0):	rotation_degrees += 360
		
	if  rotation_degrees > 270 or rotation_degrees <90 :
		$Arma_Sprite.set_flip_v(false)
		get_parent().get_node("Jugador_Sprite").set_flip_h(false)
		self.position.y = -2
	else:
		$Arma_Sprite.set_flip_v(true)
		get_parent().get_node("Jugador_Sprite").set_flip_h(true)

func _mira_mouse(object):
	mouse_position = get_global_mouse_position()
	object.look_at(mouse_position)
	
# -------------------------------------------------------------------------------------
# ------------------------------ MANEJO ATRIBUTOS ARMA --------------------------------
# -------------------------------------------------------------------------------------

func cambia_skin(skin):
	var ruta = Engine.get_meta("ruta_skin")
	var skin_arma = load(ruta + "/" + skin + ".png")
	$Arma_Sprite.set_texture(skin_arma)

func mas_proyectiles(value):
	cant_proyectiles += value

func set_dispersion_angular(value):
	dispersion_angular = value

func get_rango():
	return rango
	
func set_rango(value):
	rango = value
	
func incremento_rango(porcentaje):
	rango = rango * porcentaje

func get_damage_Arma():
	return damage_Arma 

func set_damage_Arma(value):
	damage_Arma = value

func incremento_damage(porcentaje):
	damage_Arma = damage_Arma * porcentaje

func get_cadencia_disparo():
	return cadencia_disparo

func set_cadencia_disparo(value):
	cadencia_disparo = value

func incremento_cadencia(porcentaje):
	cadencia_disparo = cadencia_disparo / porcentaje

func incrementa_velocidad_proyectil(porcentaje):
	velocidad_proyectil = velocidad_proyectil * porcentaje

func set_cant_atraviesa(value):
	cant_atraviesa = value

