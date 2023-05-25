extends "res://producto/scripts/MunicionEnemigo.gd"

func _ready():
	pass 

func accion():
	$Sprite.hide()
	call_deferred("disable_shape")
	for _i in range(10):
		jugador.recibe_ataque(1)
		yield(get_tree().create_timer(0.5), "timeout")
	queue_free()
	
func disable_shape():
	$CollisionShape2D.disabled = true
