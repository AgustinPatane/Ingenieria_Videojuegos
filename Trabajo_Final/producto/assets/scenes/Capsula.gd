extends Node2D


onready var timer = get_node("Timer_mantener_tecla")
onready var animacion = get_node("Sprite_Base/AnimationPlayer")
onready var sprite = get_node("Sprite_Base")
onready var sprite_capsula = get_node("Sprite_capusla/AnimatedSprite")

var jugador

signal capsula(cap)
signal exit_capsula

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(_body):
	emit_signal("capsula",self)

func prueba():
	pass


func arrancar_timer(j):
	animacion.play("go")
	sprite_capsula.play("go")
	jugador = j
	timer.start()

func parar_timer():
	animacion.stop()
	sprite_capsula.stop()
	sprite.frame = 0
	timer.stop()

func _on_Timer_mantener_tecla_timeout():
	jugador._evolucion()


func _on_Area2D_body_exited(_body):
	parar_timer()
