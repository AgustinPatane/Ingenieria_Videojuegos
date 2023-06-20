extends Node2D

onready var timer = get_node("Timer_mantener_tecla")
onready var animacion = get_node("Sprite_Base/AnimationPlayer")
onready var sprite = get_node("Sprite_Base")

var jugador

signal capsula(cap)
signal exit_capsula

func _ready():
	$Humo/AnimationPlayer.play("humo")
	$Timer_mantener_tecla.wait_time = Atributos.tiempos.evol
	pass # Replace with function body.

func _on_Area2D_body_entered(_body):
	emit_signal("capsula",self)

func prueba():
	pass

func get_pos():
	return self.position

func arrancar_timer(j):
	animacion.play("go")
	jugador = j
	timer.start()

func parar_timer():
	animacion.stop()
	sprite.frame = 0
	timer.stop()

func _on_Timer_mantener_tecla_timeout():
	jugador._evolucion()

func _on_Area2D_body_exited(_body):
	emit_signal("exit_capsula")
	parar_timer()
