extends "res://producto/scripts/Enemigo.gd"



func spawnear() -> void:
	mapa.spawn_timer("Demonio",5)



func _ready():
	mapa.connect("spawn_enemy", self, "spawnear")



func _process(_delta):
	pass
