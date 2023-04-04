extends Area2D
var jugador
const recuperacion = 5

func _ready():
	jugador = get_node("/root/Mapa/Jugador")



func _process(delta):
	pass




func _on_Item_body_entered(body):
	if "Jugador" in body.name:
		jugador.recupera_vida(recuperacion)
		queue_free()


