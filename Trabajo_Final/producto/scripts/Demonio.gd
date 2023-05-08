extends "res://producto/scripts/Enemigo.gd"

func _ready():
	set_vida(2000)
	set_danio(50)
	set_experiencia(100)
	set_puntos_muerte(50)
	set_speed(100)

func ataque():
	jugador.recibe_ataque(danio)

func _process(_delta):
	if !flag_tocando_player:
		if pos_jugador.x < position.x:
			self.scale.x = abs(self.scale.x)
		else:
			self.scale.x = abs(self.scale.x) * -1
