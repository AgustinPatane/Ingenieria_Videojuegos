extends Node

export(int) var count = 1
var next = 0
var audios = []

# Called when the node enters the scene tree for the first time.
func _ready():
	if (self.get_child_count() == 0):
		pass
		#print("no hay AudioStreamPlayer")
	else:
		var child = self.get_child(0)
		if child is AudioStreamPlayer:
			audios.append(child)
			for _i in range(count):
				var duplicado = child.duplicate()
				self.add_child(duplicado)
				audios.append(duplicado)

func get_count():
	return count
	
func set_count(value):
	count = value

func set_volumen(val):
	for i in range(self.get_child_count()):
		self.get_child(i).volume_db = val

# funciona pero hay que arreglar que cuando se termine de reproducir el audio, la copia haga queue_free()
# porque sino se agrega un hijo cada vez que se reproduce el audio
func play_sound():
	if !audios[next].playing:
		var copy = audios[next].duplicate()
		self.add_child(copy)
		copy.play()
		if self.get_child_count() > 5:
			self.get_child(3).queue_free()
		next += 1
		next %= audios.size()
		
func stop_sound():
	for i in range(self.get_child_count()):
		self.get_child(i).stop()
		
	
