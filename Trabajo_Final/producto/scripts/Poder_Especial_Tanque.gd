extends Sprite

var tipo = ""
onready var jugador = get_parent()

func _ready():
	pass

func activar():
	jugador.poder_en_uso = true
	#esto de los IF´s despues lo cambio para hacerlo de la forma correcta
	#pero es para probar
	if tipo == "escudo":
		escudo()
	if tipo == "rayo":
		rayo()
	if tipo == "bomba":
		bomba()
	if tipo == "hielo":
		hielo()
	if tipo == "balas":
		balas()

func set_tipo(tipo_poder):
	tipo = tipo_poder

func escudo():
	#escudo en principio no hace falta nada, basta con el poder en uso en true
	pass

func rayo():
	jugador.set_velocidad(jugador.get_velocidad()*5)
	#esto incrementaria la velocidad durante el tiempo del timer que comparte con balas
	pass

func bomba():
	#aca agregaria una zona de radio que explotaria con una animacion
	#y los enemigos en esa area se mueren instantaneamente
	pass

func hielo():
	#esto es lo del efecto congelacion durante el timer
	Engine.set_meta("freeze","true")
	emit_signal("freeze")
	jugador.efecto_Congelacion.visible = true
	jugador.timer_con_poder.start()
	pass

func balas():
	jugador.set_cadencia_disparo(jugador.get_cadencia_disparo()*5)
	#este timer comparte al de rayo, en este incrementa la cadencia
	pass

func timeout():
	if tipo == "escudo":
		pass
	if tipo == "rayo":
		jugador.set_velocidad(jugador.get_velocidad()/5)
		pass
	if tipo == "bomba":
		pass
	if tipo == "hielo":
		jugador.efecto_Congelacion.visible = false
		Engine.set_meta("freeze","false")
	if tipo == "balas":
		jugador.set_cadencia_disparo(jugador.get_cadencia_disparo()/10)
		pass
	pass
