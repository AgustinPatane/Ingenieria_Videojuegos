extends Node

var sonidos = []
var ultimo_indice = -1

func _ready():
	randomize()
	for i in range(self.get_child_count()):
		var child = self.get_child(i)
		sonidos.append(child)

func set_volumen(val):
	for i in range(sonidos.size()):
		sonidos[i].set_volumen(val)

func play_random_sound():
	var indice = randi() % sonidos.size()
	while indice == ultimo_indice:
		indice = randi() % sonidos.size()
	ultimo_indice = indice
	sonidos[indice].play_sound()
