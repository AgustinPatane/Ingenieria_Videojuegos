extends "res://producto/scripts/Enemigo.gd"
onready var escena_proyectil = preload("res://producto/assets/scenes/MunicionEnemigoHechicero.tscn")

var direccion = Vector2(1, 0)
var puede_disparar = true

func _ready():
	set_vida(200)
	set_danio(20)
	set_experiencia(100)
	set_puntos_muerte(50)
	set_speed(100)

func ataque():
	if puede_disparar:
		for _i in range(8):
			var disparo = escena_proyectil.instance()
			#$disparo.play()
			disparo.direction = direccion
			direccion = direccion.rotated(deg2rad(45))
			disparo.global_position = $Pos_disparo.global_position
			disparo.rotation_degrees = disparo.direction.angle() * 180 / 3.141592
			disparo.set_damage(self.danio)
			disparo.set_rango(6)
			disparo.set_speed(100)
			get_node("/root/Mapa").add_child(disparo)
		puede_disparar = false
	else:
		puede_disparar = true

func _process(_delta):
	pass
