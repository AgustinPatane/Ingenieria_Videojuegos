extends Control

onready var label_puntos = get_node("Puntos")
var puntos = 10000

func _ready():
	label_puntos.text = str(puntos)

func _process(delta):
	pass

func comprar_item(item):
	if puntos >= item.costo:
		puntos -= item.costo
		var purchased_item = item.instance()
		add_child(purchased_item)
	else:
		print("Not enough money!")


