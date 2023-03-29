extends Area2D

var pos_jugador = Vector2.ZERO
var speed = 100
var vidas = 2

func recibe_damage():
	vidas -=1
	if vidas == 0:
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	#pos_jugador = get_node("Jugador").global_position
	#var dir = (pos_jugador - position).normalized()
	#position += dir * speed * delta
	pass

func _on_Enemigo_area_entered(area):
	print(area.name)
	if "Proyectil" in area.name:
		recibe_damage()
		area.queue_free()
