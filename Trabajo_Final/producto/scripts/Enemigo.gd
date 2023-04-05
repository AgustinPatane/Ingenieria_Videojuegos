extends Area2D

var pos_jugador = Vector2.ZERO
var speed = 100
var vidas = 2
var jugador

func recibe_damage():
	vidas -=1
	if vidas == 0:
		jugador.suma_puntos(5)
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("mov")
	jugador = get_node("/root/Mapa/Jugador")
	
func _process(delta):
	pos_jugador = jugador.position
	var dir = (pos_jugador - position).normalized()
	position += dir * speed * delta

func _on_Enemigo_area_entered(area):
	if "Proyectil" in area.name:
		recibe_damage()
		area.queue_free()
		jugador.suma_puntos(1)

func _on_Enemigo_body_entered(body):
	if jugador and "Jugador" in body.name:
		jugador.recibe_ataque(10)


