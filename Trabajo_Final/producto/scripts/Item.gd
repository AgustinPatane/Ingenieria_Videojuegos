extends Area2D
var jugador
var en_Area = false
var pos_jugador = Vector2.ZERO

func _ready():
	jugador = get_node("/root/Mapa/Jugador")

func _process(delta):
	if en_Area:
		pos_jugador = jugador.position
		var dir = (pos_jugador - position).normalized()
		position += dir * 300 * delta

func accion():
	pass

func _on_Item_body_entered(body):
	if "Jugador" in body.name:
		accion()
		queue_free()

func _on_Item_area_entered(area):
	if "area_recoleccion" in area.name:
		en_Area = true

func _on_Item_area_exited(area):
	if "area_recoleccion" in area.name:
		en_Area = false
