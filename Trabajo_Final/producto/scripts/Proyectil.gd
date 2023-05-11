extends Area2D

var direction = Vector2.RIGHT
var speed 
var damage = 0 setget set_damage, get_damage
var rango = 0 setget set_rango, get_rango
var cant_atraviesa 

func set_rango(val):
	rango = val
	
func get_rango():
	return rango

func get_damage():
	return damage

func set_damage(value):
	damage = value

func set_velocidad(value):
	speed = value
	
func set_atraviesa(value):
	cant_atraviesa = value

func _ready():
	var timer = Timer.new()
	timer.wait_time = rango
	add_child(timer)
	timer.connect("timeout", self, "eliminar")
	timer.start()

func choca():
	cant_atraviesa -= 1
	if cant_atraviesa == 0:
		queue_free()
		
func eliminar():
	queue_free()

func _process(delta):
	translate(direction.normalized() * speed * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

