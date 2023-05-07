extends "res://producto/scripts/Enemigo.gd"
onready var pos_disparo = get_node("Pos_disparo")
var subiendo = true
var timer

func _ready():
	set_vida(500)
	set_danio(10)
	set_experiencia(1)
	set_puntos_muerte(2)
	set_speed(10)
	
	timer = Timer.new()
	timer.wait_time = 0.6
	timer.one_shot = false
	timer.connect("timeout",self,"_on_timer_timeout")
	self.add_child(timer)
	timer.start()

func _on_timer_timeout():
	subiendo = !subiendo

func _process(_delta):
	if subiendo:
		pos_disparo.position.y -= 0.1
	else:
		pos_disparo.position.y += 0.1
		
