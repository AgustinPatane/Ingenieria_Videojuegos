extends "res://producto/scripts/Enemigo.gd"
onready var escena_proyectil = preload("res://producto/assets/scenes/MunicionEnemigoHechicero.tscn")

var direccion = Vector2(1, 0)
var puede_disparar = true

func _ready():
	var atrib = Atributos.get_hechicero()
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)

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
			get_node("/root/"+Engine.get_meta("nombre_escena_mapa")).add_child(disparo)
			if verifica_pos():
				SoundManager.play_disparo_enemigo()
		puede_disparar = false
	else:
		puede_disparar = true

# funciona solo a veces
func verifica_pos():
	var camera_rect = Rect2(
		position.x - (OS.window_size.x / 2),
		position.y - (OS.window_size.y / 2),
		OS.window_size.x,
		OS.window_size.y
	)
	return camera_rect.has_point($Sprite.global_position)

func _process(_delta):
	pass
