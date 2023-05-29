extends Node2D


onready var timer = get_node("Timer_mantener_tecla")
onready var animacion = get_node("Sprite_Base/AnimationPlayer")
onready var sprite = get_node("Sprite_Base")
onready var sprite_capsula = get_node("Sprite_capusla/AnimatedSprite")
onready var sprite_estatico_capsula = get_node("Sprite_capusla")

var ruta = load("res://producto/assets/img/Capsula/Capsule1.png")
var jugador

signal capsula(cap)
signal exit_capsula

func _ready():
	sprite_capsula.visible = false
	pass # Replace with function body.

func _on_Area2D_body_entered(_body):
	emit_signal("capsula",self)

func prueba():
	pass


func arrancar_timer(j):
	sprite_capsula.visible = true
	animacion.play("go")
	sprite_capsula.play("go")
	jugador = j
	timer.start()

func parar_timer():
	animacion.stop()
	sprite_capsula.stop()
	sprite.frame = 0
	sprite_capsula.visible = false
	sprite_estatico_capsula.set_texture(ruta)
	timer.stop()

func _on_Timer_mantener_tecla_timeout():
	jugador._evolucion()
	sprite_capsula.visible = false
	sprite_estatico_capsula.set_texture(ruta)


func _on_Area2D_body_exited(_body):
	sprite_capsula.visible = false
	sprite_estatico_capsula.set_texture(ruta)
	emit_signal("exit_capsula")
	parar_timer()
