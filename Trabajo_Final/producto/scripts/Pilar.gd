extends "res://producto/scripts/Enemigo.gd"
onready var pos_disparo = get_node("Pos_disparo")
var subiendo = true
var timer

func _ready():
	var atrib = Atributos.get_pilar()
	set_vida(atrib.vida)
	set_danio(atrib.danio)
	set_experiencia(atrib.experiencia)
	set_puntos_muerte(atrib.puntos_muerte)
	set_speed(atrib.speed)
	
	timer = Timer.new()
	timer.wait_time = 0.6
	timer.one_shot = false
	timer.connect("timeout",self,"_on_timer_timeout")
	self.add_child(timer)
	timer.start()

func _on_timer_timeout():
	subiendo = !subiendo

func acomodar():
	pass

func _process(_delta):
	if subiendo:
		pos_disparo.position.y -= 0.1
	else:
		pos_disparo.position.y += 0.1
		
