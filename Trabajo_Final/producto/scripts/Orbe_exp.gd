extends Area2D

var pos_jugador = Vector2.ZERO
var value = 1
var jugador
var escala = 0.7
var en_Area = false
var tiempo_parpadeo = 15
var nombre_mapa

func _ready():
	$Sombra.modulate = Color(1, 1, 1, 0.5)
	self.scale.y = escala
	self.scale.x = escala
	$AnimationPlayer.play("anim")
	position.y += 30
	nombre_mapa=Engine.get_meta("nombre_escena_mapa")
	jugador = get_node("/root/"+nombre_mapa+"/Jugador")
	
	var timer = Timer.new()
	timer.wait_time = tiempo_parpadeo
	self.add_child(timer)
	timer.connect("timeout", self, "parpadea")
	timer.start()
	
func parpadea():
	for i in range(30):
		$Sprite.visible = !$Sprite.visible
		$Sombra.visible = !$Sombra.visible
		yield(get_tree().create_timer(0.2 / pow(1.1, i)), "timeout")
	queue_free()

func _set_value(val):
	self.value = val

func _process(delta):
	if en_Area:
		pos_jugador = jugador.position
		var dir = (pos_jugador - position).normalized()
		position += dir * 300 * delta

func _on_Orbe_exp_body_entered(body):
	if "Jugador" in body.name:
		jugador.gana_exp(value)
		queue_free()

func _on_Orbe_exp_area_entered(area):
	if "area_recoleccion" in area.name:
		en_Area = true

func _on_Orbe_exp_area_exited(area):
	if "area_recoleccion" in area.name:
		en_Area = false
