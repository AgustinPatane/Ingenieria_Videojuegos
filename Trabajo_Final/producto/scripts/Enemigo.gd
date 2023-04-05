extends Area2D

var pos_jugador = Vector2.ZERO
var speed = 100
var vidas = 2
var jugador
var danio = 10
var puntos = 1
var puntos_muerte = 5
var experiencia = 1

func recibe_damage():
	vidas -=1
	if vidas == 0:
		jugador.suma_puntos(puntos_muerte)
		jugador.gana_exp(experiencia)
		muere()
		#queue_free()

func muere():
	$AnimatedSprite.play("die")
	jugador.suma_puntos(puntos_muerte)


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("mov")
	jugador = get_node("/root/Mapa/Jugador")
	
func _process(delta):
	if (vidas>0):
		pos_jugador = jugador.position
		var dir = (pos_jugador - position).normalized()
		if pos_jugador.x < position.x:
			get_node("AnimatedSprite").set_flip_h(true)
		else:
			get_node("AnimatedSprite").set_flip_h(false)
		position += dir * speed * delta

func _on_Enemigo_area_entered(area):
	if "Proyectil" in area.name:
		recibe_damage()
		area.queue_free()
		jugador.suma_puntos(puntos)

func _on_Enemigo_body_entered(body):
	if jugador and "Jugador" in body.name:
		jugador.recibe_ataque(danio)
		$AnimatedSprite.play("attack")

	
	
