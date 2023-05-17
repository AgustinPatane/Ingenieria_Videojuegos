extends Sprite

onready var jugador = get_parent()

func _ready():
	pass

func escudo():
	print("llego al escudo aca")
	print(jugador.tanque)
	jugador.tanque = true
	print(jugador.tanque)
	jugador.get_node("Poder_Especial_Tanque/timer_con_escudo").start()
