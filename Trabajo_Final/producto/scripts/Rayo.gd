extends RayCast2D

var is_casting = false
var radio = 0
var speed = 0.2
var angulo = 0
var timer
var x 
var y
var jugador

onready var fin_rayo = get_node("final")

func get_is_casting():
	return is_casting

# Called when the node enters the scene tree for the first time.
func _ready():
	jugador = get_node("/root/Mapa/Jugador")
	fin_rayo.hide()
	timer = Timer.new()
	timer.wait_time =5
	timer.connect("timeout",self,"_on_timer_timeout")
	self.add_child(timer)
	timer.start()
	cast_to = Vector2.ZERO
	set_physics_process(false)
	$Line2D.points[1] = Vector2.ZERO

func _on_timer_timeout():
	if is_casting:
		timer.wait_time = 5
		disappear()
		fin_rayo.hide()
		is_casting = false
		cast_to = Vector2.ZERO
	else:
		timer.wait_time = 10
		angulo = rand_range(0,360)
		fin_rayo.rotation_degrees = angulo
		speed = 0.2
		radio = 0
		appear()
		is_casting = true
		
	set_physics_process(is_casting)
	timer.start()
	
func _process(delta):
	x = radio * cos(angulo)
	y = radio * sin(angulo)
	if is_casting:
		if is_colliding() and get_collider().name == "Jugador":
			jugador.recibe_ataque(1)
		
		if speed < 3:
			speed += 0.005
		if radio < 400:
			radio += 0.5
			
		$Line2D.points[1] = Vector2(x,y)
		fin_rayo.position = Vector2(x,y)
		fin_rayo.show()
		angulo += speed * delta
		cast_to = Vector2(x,y)
		fin_rayo.rotation_degrees = angulo * 180 / 3.141592

func _physics_process(_delta):
	force_raycast_update()

func appear():
	$Tween.stop_all()
	$Tween.interpolate_property($Line2D, "width", 0, 10.0, 0.2)
	$Tween.start()

func disappear():
	$Tween.stop_all()
	$Tween.interpolate_property($Line2D, "width", 10.0, 0, 0.1)
	$Tween.start()
