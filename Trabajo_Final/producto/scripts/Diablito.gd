extends "res://producto/scripts/Enemigo.gd"

func _ready():
	set_vida(40)
	set_danio(25)
	set_experiencia(10)
	set_puntos_muerte(20)
	set_speed(200)

func ataque():
	jugador.recibe_ataque(danio)

func _process(_delta):
	if !flag_tocando_player:
		if pos_jugador.x < position.x:
			self.scale.x = abs(self.scale.x)
		else:
			self.scale.x = abs(self.scale.x) * -1
