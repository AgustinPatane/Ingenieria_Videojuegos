extends "res://producto/scripts/Enemigo.gd"

var tiempo_spawn = 2

func get_tiempo_spawn():
	return tiempo_spawn
	
func set_tiempo_spawn(value):
	tiempo_spawn = value

func spawnear() -> void:
	mapa.spawn_timer("Demonio",tiempo_spawn)



func _ready():
	mapa.connect("spawn_enemy", self, "spawnear")



func _process(_delta):
	pass
