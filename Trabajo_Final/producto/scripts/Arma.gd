extends Node2D

var a =0
var mouse_position
var fire_rate = 20

onready var escena_proyectil = preload("res://producto/assets/scenes/Proyectil.tscn")

func _mira_mouse(object):
	mouse_position = get_global_mouse_position()
	object.look_at(mouse_position)
		
func _dispara():
	var disparo = escena_proyectil.instance()
	$disparo.play()
	disparo.direction = mouse_position - $Position_arma.global_position
	disparo.global_position = $Position_arma.global_position
	disparo.rotation_degrees = rotation_degrees
	get_tree().get_root().add_child(disparo)
<<<<<<< Updated upstream
=======
	bullet_charger=bullet_charger-1
	if bullet_charger==0:
		$disparo.stop()
>>>>>>> Stashed changes

func _ready():
	pass
	

func _process(_delta):
	_mira_mouse(self)
	
	if(rotation_degrees > 360):	rotation_degrees -=360
	elif(rotation_degrees < 0):	rotation_degrees += 360
		
	if  rotation_degrees > 270 or rotation_degrees <90 :
		$Arma_Sprite.set_flip_v(false)
		get_parent().get_node("Jugador_Sprite").set_flip_h(false)
		self.position.y = -2
	else:
		$Arma_Sprite.set_flip_v(true)
		get_parent().get_node("Jugador_Sprite").set_flip_h(true)
		
	if Input.is_action_pressed("shoot") and a % fire_rate==0: 
		_dispara()
<<<<<<< Updated upstream
=======
	
	if Input.is_action_pressed("recharge"):
		bullet_charger=20
		$reload.play()
>>>>>>> Stashed changes
	 
	a+=1
