extends Area2D
var jugador
var en_Area = false
var pos_jugador = Vector2.ZERO
var tiempo_parpadeo = 20

func set_tiempo_parpadeo(value):
	tiempo_parpadeo = value

func _ready():
	$Sombra.modulate = Color(1,1,1,0.5)
	$AnimationPlayer.play("idle")
	jugador = get_node("/root/Mapa/Jugador")
	
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
