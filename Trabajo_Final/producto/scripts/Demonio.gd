extends "res://producto/scripts/Enemigo.gd"

onready var escena_proyectil = preload("res://producto/assets/scenes/MunicionEnemigo.tscn")

func _ready():
	var atrib = Atributos.get_demonio()
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)
	
	var timer = Timer.new()
	timer.wait_time = 1.5
	timer.connect("timeout",self,"_dispara", [16,false])
	self.add_child(timer)
	timer.start()

func ataque():
	jugador.recibe_ataque(danio)

func _dispara(cantidad, pos):
	var direccion = Vector2(1, 0)
	for _i in range(cantidad):
		var disparo = escena_proyectil.instance()
		disparo.direction = direccion
		direccion = direccion.rotated(deg2rad(360/cantidad))
		if pos:
			disparo.global_position = $Pos_Ataque.global_position
		else:
			disparo.global_position = self.global_position
		disparo.rotation_degrees = disparo.direction.angle() * 180 / 3.141592
		disparo.set_damage(self.danio/10)
		disparo.set_rango(8)
		disparo.set_speed(120)
		get_node("/root/"+Engine.get_meta("nombre_escena_mapa")).add_child(disparo)


func _on_AnimationPlayer_animation_finished2(anim_name):
	if anim_name == "atack":
		for _i in range(10):
			SoundManager.play_espadazo()
			_dispara(4, true)
			yield(get_tree().create_timer(200), "timeout")
		

