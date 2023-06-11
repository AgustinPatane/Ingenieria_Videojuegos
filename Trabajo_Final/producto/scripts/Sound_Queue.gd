extends Node

export(int) var count = 1
var next = 0
var audios = []

# Called when the node enters the scene tree for the first time.
func _ready():
	if (self.get_child_count() == 0):
		print("no hay AudioStreamPlayer")
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
	for i in range(audios.size()):
		audios[i].volume_db = val

func play_sound():
	if !audios[next].playing:
		var copy = audios[next].duplicate()
		self.add_child(copy)
		copy.play()
		next += 1
		next %= audios.size()
	
func _on_audio_finished():
	print("cacaascascacsa")
		
func stop_sound():
	for i in range(audios.size()):
		audios[i].stop()
