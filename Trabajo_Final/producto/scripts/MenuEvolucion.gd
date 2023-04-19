extends Control

onready var opcion_1 = get_node("Opcion_1")
onready var opcion_2 = get_node("Opcion_2")
onready var btn_seleccionar = get_node("Seleccionar")

var evolucion_actual = ""
var seleccionado

var evolucion_1 = {
	"nombre": "cadencia",
	"cadencia": 1.5,
	"vida": 0.75,
	"velocidad": 1.2,
	"damage": 0.75,
	"rango": 0.75
}

var evolucion_1_1 = {
	"nombre": "cadencia/cadencia",
	"cadencia": 2,
	"vida": 1,
	"velocidad": 1,
	"damage": 0.75,
	"rango": 1
}

var evolucion_1_2 = {
	"nombre": "cadencia/velocidad",
	"cadencia": 1.5,
	"vida": 0.75,
	"velocidad": 1.2,
	"damage": 1,
	"rango": 0.75
}

var evolucion_2 = {
	"nombre": "damage",
	"cadencia": 0.75,
	"vida": 1.5,
	"velocidad": 0.75,
	"damage": 1.5,
	"rango": 1.5
}

var evolucion_2_1 = {
	"nombre": "damage/proyectiles",
	"cadencia": 1,
	"vida": 1.5,
	"velocidad": 1,
	"damage": 1.5,
	"rango": 0.75
}

var evolucion_2_2 = {
	"nombre": "damage/rango",
	"cadencia": 0.75,
	"vida": 1.5,
	"velocidad": 0.75,
	"damage": 2,
	"rango": 2
}

# Called when the node enters the scene tree for the first time.
func _ready():
	#btn_seleccionar.set_disabled(true)
	pass
	
func set_botones(evolucion_act):
	evolucion_actual = evolucion_act
	opcion_1.set_normal_texture(load("res://producto/assets/img/evolucion/"+evolucion_act+"_1/normal.png"))
	opcion_1.set_pressed_texture(load("res://producto/assets/img/evolucion/"+evolucion_act+"_1/pressed.png"))
	opcion_1.set_hover_texture(load("res://producto/assets/img/evolucion/"+evolucion_act+"_1/pressed.png"))
	opcion_2.set_normal_texture(load("res://producto/assets/img/evolucion/"+evolucion_act+"_2/normal.png"))
	opcion_2.set_pressed_texture(load("res://producto/assets/img/evolucion/"+evolucion_act+"_2/pressed.png"))
	opcion_2.set_hover_texture(load("res://producto/assets/img/evolucion/"+evolucion_act+"_2/pressed.png"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !opcion_1.is_pressed() and !opcion_2.is_pressed():
		btn_seleccionar.set_disabled(true)
	else:
		btn_seleccionar.set_disabled(false)

func _on_Opcion_2_button_down():
	if opcion_1.is_pressed():
		opcion_1.set_pressed(false)
	seleccionado = 2
	print("hola")
	#print(self[evolucion_actual + "_" + str(seleccionado)])

func _on_Opcion_1_button_down():
	if opcion_2.is_pressed():
		opcion_2.set_pressed(false)
	seleccionado = 1
	#print(self[evolucion_actual + "_" + seleccionado])
		
func _on_Seleccionar_pressed():
	get_parent().actualiza_atributos(self[evolucion_actual + "_" + str(seleccionado)], str(seleccionado))
	get_tree().paused = false
	get_parent().on_evol_quit()
	#emit_signal("evolucionar")
	queue_free()
	pass # Replace with function body.
