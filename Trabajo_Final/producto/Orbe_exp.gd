extends Area2D

var pos_jugador = Vector2.ZERO
var value = 1
var jugador
var escala = 0.7
var en_Area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale.y = escala
	self.scale.x = escala
	$AnimationPlayer.play("anim")
	position.y += 30
	jugador = get_node("/root/Mapa/Jugador")

func _set_value(val):
	self.value = val

func _process(delta):
	if en_Area:
		pos_jugador = jugador.position
		var dir = (pos_jugador - position).normalized()
		position += dir * 300 * delta

func _on_Orbe_exp_body_entered(body):
	if "Jugador" in body.name:
		print("hola")
		jugador.gana_exp(value)
		queue_free()


func _on_Orbe_exp_area_entered(area):
	if "area_recoleccion" in area.name:
		en_Area = true

func _on_Orbe_exp_area_exited(area):
	if "area_recoleccion" in area.name:
		en_Area = false
