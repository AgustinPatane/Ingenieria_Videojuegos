extends Area2D

var direction = Vector2.RIGHT
var speed = 800
var damage = 0 setget set_damage, get_damage
var rango = 0 setget set_rango, get_rango
var cant_atraviesa = 1
var explotando = false

func set_rango(val):
	rango = val
	
func get_rango():
	return rango

func get_damage():
	return damage

func set_damage(value):
	damage = value

func set_velocidad(value):
	speed = value
	
func set_atraviesa(value):
	cant_atraviesa = value

func _ready():
	$AnimationPlayer.play("move")
	$area_eplosion.monitoring = false

func choca():
	scale.x = 2
	scale.y = 2
	$AnimationPlayer.play("explotar")
	$area_eplosion.monitoring = true
	var temporizador = Timer.new()
	self.add_child(temporizador)
	temporizador.wait_time = 0.1
	temporizador.connect("timeout", self, "elimina_area_explosion")
	temporizador.start()
	explotando = true
	speed = 0

func elimina_area_explosion():
	$area_eplosion.monitoring = false

func _process(delta):
	translate(direction.normalized() * speed * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "explotar":
		queue_free()

func _on_area_eplosion_area_entered(area):
	if explotando and area.is_in_group("Enemigo"):
		area.recibe_damage(damage, area.position)
