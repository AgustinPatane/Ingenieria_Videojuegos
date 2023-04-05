extends KinematicBody2D

# NODOS ---------------------------------------------------
onready var balas = get_node("Control/Balas")
onready var barra_vida = get_node("Control/BarraVida")
onready var puntaje = get_node("Control/Puntaje")
onready var barra_exp = get_node("Control/BarraExperiencia")
onready var label_nivel = get_node("Control/Lvl")
onready var arma = get_node("Arma")
onready var spriteLvlUp = get_node("Lvp_up")
onready var animLvlUp = get_node("Lvp_up/Anim_lvl_up")

# VARIABLES -----------------------------------------------
var motion = Vector2()
var vel_walk = 20000
var vel_run = 35000
var SPEED = 0
var puntos = 0
var vida = 100
var experiencia = 0
var nivel = 1
var experiencia_necesaria = 5

# SIGNALS ------------------------------------------------
signal player_defeated

# FUNCIONES ----------------------------------------------
func _ready():
	spriteLvlUp.visible = false
	barra_exp.max_value = experiencia_necesaria
	barra_exp.value = experiencia
	label_nivel.text = " Lvl: " + str(nivel)
	
func _process(delta):
	_movimiento(delta)
	puntaje.text = " Score: "+str(self.puntos)
	barra_vida.value = self.vida
	balas.text = str(arma.bullet_charger)
	actualiza_vida()
	
func actualiza_vida():
	barra_vida.max_value = 100
	
func actualiza_exp():
	barra_exp.value = experiencia

func gana_exp(value):
	experiencia += value
	actualiza_exp()
	if experiencia_necesaria <= experiencia:
		nivel += 1
		experiencia = 0
		experiencia_necesaria = experiencia_necesaria * round(pow(1.3,nivel))
		barra_exp.max_value = experiencia_necesaria
		label_nivel.text = "Lvl: " + str(nivel)
		spriteLvlUp.visible = true
		animLvlUp.play("LVL_UP")
		actualiza_exp()

func _movimiento(delta):
	motion = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
		get_node("Jugador_Sprite").set_flip_h(false)
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
		get_node("Jugador_Sprite").set_flip_h(true)
	if Input.is_action_pressed("ui_up"):
		motion.y = -100
	elif Input.is_action_pressed("ui_down"):
		motion.y = 100
		
	motion = motion.normalized()
	
	if Input.is_action_pressed("run"): SPEED = vel_run
	else: SPEED = vel_walk
		
	motion = move_and_slide(motion*delta*SPEED)

func suma_puntos(cantidad):
	puntos += cantidad

func recibe_ataque(danio):
	vida-=danio
	if vida<=0:
		emit_signal("player_defeated")
	
func recupera_vida(cant):
	if (vida+cant) <= 100: 
		vida+=cant
		
func _on_Anim_lvl_up_animation_finished(anim_name):
	spriteLvlUp.visible =false
