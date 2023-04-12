extends Area2D

var pos_jugador = Vector2.ZERO
var speed = 100
var vidas = 2
var jugador
var danio = 10
#var puntos = 1
var puntos_muerte = 5
var experiencia = 1
var flag_tocando_player = false

onready var escena_exp = preload("res://producto/assets/scenes/Orbe_exp.tscn")

func recibe_damage():
	vidas -=1
	if vidas == 0:
		muere()

func muere():
	#$death.play()
	$AnimationPlayer.play("die")
	jugador.suma_puntos(puntos_muerte)
	get_node("CollisionShape2D").queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("move")
	jugador = get_node("/root/Mapa/Jugador")
	
func _process(delta):
	if (vidas>0):
		pos_jugador = jugador.position
		var dir = (pos_jugador - position).normalized()
		if !flag_tocando_player:
			if pos_jugador.x < position.x:
				self.scale.x = 1
			else:
				self.scale.x = -1
		position += dir * speed * delta

func _on_Enemigo_area_entered(area):
	if "Proyectil" in area.name:
		recibe_damage()
		#$damage.play()
		area.queue_free()
		#jugador.suma_puntos(puntos)


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		var orbe_exp = escena_exp.instance()
		orbe_exp.position = self.position
		orbe_exp._set_value(experiencia)
		get_tree().get_root().add_child(orbe_exp)
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


func _on_Enemigo_body_entered(body):
	if jugador and "Jugador" in body.name:
		flag_tocando_player = true


func _on_Enemigo_body_exited(body):
	if jugador and "Jugador" in body.name:
		flag_tocando_player = false