extends Node2D

const GRAVITY = -1000
var velocity = Vector2(150, -800)
var time = 0
var direccion

func _ready():
	direccion = round(rand_range(0, 1)) 
	if direccion == 0: direccion = -1
	velocity.x = direccion * velocity.x
	
	var temporizador = Timer.new()
	self.add_child(temporizador)
	temporizador.wait_time = 0.4
	temporizador.connect("timeout", self, "queue_free")
	temporizador.start()

func _process(delta):
	velocity.y += GRAVITY * delta
	position += velocity * delta
	time += delta
	velocity.y = 300 * time * time + 400.0 * time
	
	
func set_texto(txt):
	$Label.text = txt
	
func set_position(pos):
	self.position = pos
