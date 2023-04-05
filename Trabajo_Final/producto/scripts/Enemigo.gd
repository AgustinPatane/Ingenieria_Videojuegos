extends Area2D

var pos_jugador = Vector2.ZERO
var speed = 100
var vidas = 2
var jugador
var danio = 10
#var puntos = 1
var puntos_muerte = 5
var experiencia = 1

func recibe_damage():
	vidas -=1
	if vidas == 0:
		jugador.suma_puntos(puntos_muerte)
		jugador.gana_exp(experiencia)
		get_node("CollisionShape2D").queue_free()
		muere()

func muere():
	$AnimationPlayer.play("die")
	jugador.suma_puntos(puntos_muerte)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("move")
	jugador = get_node("/root/Mapa/Jugador")
	
func _process(delta):
	if (vidas>0):
		pos_jugador = jugador.position
		var dir = (pos_jugador - position).normalized()
		if pos_jugador.x < position.x:
			get_node("Sprite").set_flip_h(false)
		else:
			get_node("Sprite").set_flip_h(true)
		position += dir * speed * delta

func _on_Enemigo_area_entered(area):
	if "Proyectil" in area.name:
		recibe_damage()
		area.queue_free()
		#jugador.suma_puntos(puntos)


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		queue_free()
	if anim_name == "atack":
		jugador.recibe_ataque(danio)
		$AnimationPlayer.play("atack")


func _on_Area2D_body_entered(body):
	if jugador and "Jugador" in body.name and $AnimationPlayer.current_animation != "die":
		$AnimationPlayer.play("atack")


func _on_Area_ataque_body_exited(body):
	if jugador and "Jugador" in body.name and  $AnimationPlayer.current_animation != "die":
		$AnimationPlayer.play("move")
