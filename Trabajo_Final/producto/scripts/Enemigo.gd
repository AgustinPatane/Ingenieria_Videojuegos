extends Area2D

var pos_jugador = Vector2.ZERO
var speed
var vida 
var jugador
var danio
var puntos_muerte
var experiencia
var flag_tocando_player = false
var flag_en_area_ataque = false
var muerto = 0
var freeze = Engine.get_meta("freeze")
var xpermiso = false
var riesgo = false

onready var escena_txt_danio = preload("res://producto/assets/scenes/Texto_danio.tscn")
onready var escena_exp = preload("res://producto/assets/scenes/Orbe_exp.tscn")

onready var mapa = get_node("/root/"+Engine.get_meta("nombre_escena_mapa"))

func recibe_damage(damage, pos):
	var label_danio = escena_txt_danio.instance()
	label_danio.set_texto(str(damage))
	label_danio.set_position(pos)
	label_danio.z_index = self.z_index + 1
	get_parent().add_child(label_danio)
	vida -= damage
	if vida <= 0 and muerto==0:
		muere()

func set_experiencia(val):
	experiencia = val
	
func set_puntos_muerte(val):
	puntos_muerte = val
	
func set_danio(val):
	danio = val

func get_danio():
	return danio

func set_vida(val):
	vida = val

func set_speed(val):
	speed = val

func ataque():
	pass

func muere():
	#$death.play()
	muerto  = 1
	mapa = get_node("/root/"+Engine.get_meta("nombre_escena_mapa"))
	mapa.cant_enemigos=mapa.cant_enemigos-1
	#$Sombra.hide()
	$AnimationPlayer.play("die")
	jugador.gana_puntos(puntos_muerte)
	get_node("CollisionShape2D").queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sombra.modulate = Color(1,1,1,0.5)
	$AnimationPlayer.play("move")
	var nombre_mapa=Engine.get_meta("nombre_escena_mapa")
	jugador = get_node("/root/"+nombre_mapa+"/Jugador")
	jugador.connect("mascota",self,"permiso")
	jugador.connect("explosion",self,"explosion")
	self.z_index = jugador.z_index + 1

func movimiento(delta):
	pos_jugador = jugador.position
	var dir = (pos_jugador - position).normalized()
	position += dir * speed * delta
	
func acomodar():
	if !flag_tocando_player:
		if pos_jugador.x < position.x:
			self.scale.x = abs(self.scale.x)
		else:
			self.scale.x = abs(self.scale.x) * -1

func _process(delta):
	freeze = Engine.get_meta("freeze")
	if (vida>0 and freeze == "false"):
		movimiento(delta)
		acomodar()

func _on_Enemigo_area_entered(area):
	if area.is_in_group("Proyectil"):
		recibe_damage(area.get_damage(), area.position)
		area.choca()
	else:
		if area.name == "area_mascota" and xpermiso==true:
			print("______---____----___-__--__--")
			recibe_damage(30,self.position)

func permiso():
	xpermiso=true

func drop_on_death():
	var orbe_exp = escena_exp.instance()
	orbe_exp.position = self.position
	orbe_exp._set_value(experiencia)
	get_parent().add_child(orbe_exp)
	queue_free()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		drop_on_death()
	if anim_name == "atack":
		ataque()
		$AnimationPlayer.play("atack")

func _on_Area_ataque_body_entered(body):
	if jugador and "Jugador" in body.name and $AnimationPlayer.current_animation != "die":
		flag_en_area_ataque = true
		$AnimationPlayer.play("atack")

func _on_Area_ataque_body_exited(body):
	if jugador and "Jugador" in body.name and  $AnimationPlayer.current_animation != "die":
		flag_en_area_ataque = false
		$AnimationPlayer.play("move")

func _on_Enemigo_body_entered(body):
	if jugador and "Jugador" in body.name:
		flag_tocando_player = true

func _on_Enemigo_body_exited(body):
	if jugador and "Jugador" in body.name:
		flag_tocando_player = false


func _on_Area_Lenta_body_entered(body):
	if body.name == "Jugador" and jugador.poder_especial == "onda_ralentizadora":
		riesgo = true
		set_speed(speed/4)

func _on_Area_Lenta_body_exited(body):
	if body.name == "Jugador" and jugador.poder_especial == "onda_ralentizadora":
		riesgo = false
		set_speed(speed*4)

func explosion():
	if riesgo:
		self.muere()
		self.drop_on_death()
