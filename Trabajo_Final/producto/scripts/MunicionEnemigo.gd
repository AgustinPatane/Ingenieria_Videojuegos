extends Area2D


var direction = Vector2.RIGHT
var speed = 200
var damage = 0 setget set_damage, get_damage
var rango = 0 setget set_rango, get_rango
var jugador 

func set_rango(val):
	rango = val
	
func get_rango():
	return rango

func get_damage():
	return damage

func set_damage(value):
	damage = value

func _ready():
	var timer = Timer.new()
	timer.wait_time = rango
	add_child(timer)
	timer.connect("timeout", self, "eliminar")
	timer.start()
	jugador = get_node("/root/Mapa/Jugador")

func eliminar():
	print("hola")
	queue_free()

func _process(delta):
	translate(direction.normalized() * speed * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_MunicionEnemigo_body_entered(body):
	if jugador and "Jugador" in body.name:
		jugador.recibe_ataque(30)
		self.queue_free()
