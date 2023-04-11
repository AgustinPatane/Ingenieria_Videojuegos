extends Control

onready var btn_pausa = get_node("/root/Mapa/Jugador/Control/Btn_pausa")
signal continuar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func salir_pausa():
	get_tree().paused = false
	btn_pausa.visible = true
	btn_pausa.disabled = false
	emit_signal("continuar")
	self.queue_free()
	
func _on_Btn_continuar_pressed():
	salir_pausa()


func _on_Btn_salir_pressed():
	get_tree().paused = false
	var _aux = get_tree().change_scene("res://producto/assets/scenes/Menu.tscn")
