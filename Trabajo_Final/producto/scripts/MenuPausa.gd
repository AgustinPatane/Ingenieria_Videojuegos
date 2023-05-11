extends Control

signal continuar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func salir_pausa():
	get_tree().paused = false
	emit_signal("continuar")
	self.queue_free()
	
func _on_Btn_continuar_pressed():
	salir_pausa()

func _on_Btn_salir_pressed():
	get_tree().paused = false
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")
