extends KinematicBody2D

# -------------------------------------------------------------------------------------
# ------------------------------------- NODOS -----------------------------------------
# -------------------------------------------------------------------------------------

onready var puntaje = get_node("Control/Puntaje")
onready var barra_vida = get_node("Control/BarraVida")
onready var barra_exp = get_node("Control/BarraExperiencia")
onready var label_nivel = get_node("Control/Lvl")
onready var label_vida = get_node("Control/Vida")
onready var arma = get_node("Arma")
onready var spriteLvlUp = get_node("Lvp_up")
onready var animLvlUp = get_node("Lvp_up/Anim_lvl_up")
onready var btn_pausa = get_node("Control/Btn_pausa")

# -------------------------------------------------------------------------------------
# ----------------------------------- VARIABLES ---------------------------------------
# -------------------------------------------------------------------------------------

var motion = Vector2()
var SPEED = 0
var puntos = 0
var vida = 100
var experiencia = 0
var nivel = 1
var experiencia_necesaria = 1
var paused = null
var menu_pausa
var subiendo_nivel = false
var niveles_evol = [2,3,4]
var puede_correr = false

# -------------------------------------------------------------------------------------
# -------------------------------- CARACTERISTICAS ------------------------------------
# -------------------------------------------------------------------------------------

var vida_max = 100
var vel_walk = 20000
var vel_run = 1.2 * vel_walk
var evolucion_actual = "evolucion"

# -------------------------------------------------------------------------------------
# ------------------------------------ CONSTANTES ----------------------------------------
# -------------------------------------------------------------------------------------

const SAVE_PATH = "res://Saves/tienda.sav"

# -------------------------------------------------------------------------------------
# ------------------------------------ SIGNALS ----------------------------------------
# -------------------------------------------------------------------------------------

signal player_defeated
signal level_up

# -------------------------------------------------------------------------------------
# ----------------------------------- FUNCIONES ---------------------------------------
# -------------------------------------------------------------------------------------

func _ready():
	var ruta = Engine.get_meta("ruta_skin")
	var skin_body = load(ruta + "/body.png")
	var skin_arma = load(ruta + "/arma_1.png")
	$Jugador_Sprite.set_texture(skin_body)
	$Arma/Arma_Sprite.set_texture(skin_arma)
	$AnimationPlayer_body.play("idle")
	spriteLvlUp.visible = false
	barra_exp.max_value = experiencia_necesaria
	barra_exp.value = experiencia
	label_nivel.text = " Lvl: " + str(nivel)
	label_vida.text = " " + str(vida) + "/"+ str(vida_max)
	self.z_index = get_parent().get_child_count() + 1

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		pausa()		
	puntaje.text = " Score: "+str(self.puntos)
	barra_vida.value = self.vida
	actualiza_barras()
	

func aumenta_Area_recoleccion(value):
	$area_recoleccion.scale.x += value
	$area_recoleccion.scale.y += value

# -------------------------------------------------------------------------------------
# ---------------------------------- MOVIMIENTO ---------------------------------------
# -------------------------------------------------------------------------------------

func _physics_process(delta):
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
	if motion.abs() != Vector2.ZERO:
		$AnimationPlayer_body.play("move")
		arma.position.y = -5
	else:
		$AnimationPlayer_body.play("idle")
	if Input.is_action_pressed("run") and puede_correr : SPEED = vel_run
	else: SPEED = vel_walk
	motion = move_and_slide(motion*delta*SPEED)
	
	var slide_count = get_slide_count()
	if slide_count > 0:
		for i in range (slide_count):
			motion = get_slide_collision(i)
			var collider = motion.collider
			if collider.is_in_group("Wall"):
				motion = move_and_slide(delta * -SPEED)
	if !(self.position.x<1651 and self.position.x >-567 and self.position.y<980 and self.position.y >-411):
		recibe_ataque(1)
	
# -------------------------------------------------------------------------------------
# ---------------------------- MANEJO ATRIBUTOS PERSONAJE -----------------------------
# -------------------------------------------------------------------------------------

func get_vida_max():
	return vida_max
	
func set_vida_max(value):
	vida_max = value
	
func incremento_vida(porcentaje):
	vida_max = round(vida_max * porcentaje)
	
func get_velocidad():
	return vel_walk

func set_velocidad(value):
	vel_walk = value
	actualiza_vel_run()

func actualiza_vel_run():
	vel_run = 1.2 * vel_walk
	
func incremento_velocidad(porcentaje):
	vel_walk = vel_walk * porcentaje
	actualiza_vel_run()

func get_damage_Arma():
	return arma.get_damage_Arma()

func set_damage_Arma(value):
	arma.set_damage_Arma(value)

func incremento_damage(porcentaje):
	arma.incremento_damage(porcentaje)

func get_cadencia_disparo():
	return arma.get_cadencia_disparo()

func set_cadencia_disparo(value):
	arma.set_cadencia_disparo(value)

func incremento_cadencia(porcentaje):
	arma.incremento_cadencia(porcentaje)
	
func get_rango():
	arma.get_rango()
	
func set_rango(value):
	arma.set_rango(value)
	
func incremento_rango(porcentaje):
	arma.incremento_rango(porcentaje)

func recibe_ataque(danio):
	vida-=danio
	if vida<=0:
		Engine.set_meta("Puntaje",puntos)
		emit_signal("player_defeated")
		guardar_monedas()
	
func recupera_vida(cant):
	if (vida+cant) <= vida_max: vida+=cant

# -------------------------------------------------------------------------------------
# --------------------------- EXPERIENCIA y PUNTAJE -----------------------------------
# -------------------------------------------------------------------------------------

func actualiza_barras():
	label_vida.text = " " + str(vida) + "/"+ str(vida_max)
	barra_vida.value = vida
	barra_vida.max_value = vida_max
	barra_exp.value = experiencia

func gana_puntos(cantidad):
	puntos += cantidad

func gana_exp(value):
	experiencia += value
	gana_puntos(nivel)
	actualiza_barras()
	if experiencia_necesaria <= experiencia:
		nivel += 1
		emit_signal("level_up")
		if nivel == niveles_evol[0] or nivel == niveles_evol[1] or nivel == niveles_evol[2]:
			_evolucion()
		else:
			_adquiere_habilidad()
		
		experiencia = 0
		puntos += nivel * 25
		experiencia_necesaria = actualiza_exp(experiencia_necesaria)
		barra_exp.max_value = experiencia_necesaria
		label_nivel.text = "Lvl: " + str(nivel)
		subiendo_nivel = true
		vida_max += 5
		vida += round(vida_max * 0.1)
		if vida > vida_max: vida= vida_max
		actualiza_barras()

func actualiza_exp(experiencia_max):
	return experiencia_max * 2
	#return (experiencia * round(pow(1.3,nivel)))

func _on_Anim_lvl_up_animation_finished(_anim_name):
	subiendo_nivel = false
	spriteLvlUp.visible =false

# -------------------------------------------------------------------------------------
# ---------------------------------- EVOLUCION ----------------------------------------
# -------------------------------------------------------------------------------------

func _adquiere_habilidad():
	pass

func _evolucion():
	var evol_instance = load("res://producto/assets/scenes/MenuEvolucion.tscn").instance()
	self.z_index = z_index + 20
	self.add_child(evol_instance)
	var menu_evol = get_node("MenuEvolucion")
	menu_evol.set_botones(evolucion_actual)
	menu_evol.raise()
	menu_evol.rect_position = Vector2($Control/pos_pausa.position.x/2,$Control/pos_pausa.position.y/2)
	menu_evol.rect_size = Vector2(2048,1200)
	$Jugador_Sprite.hide()
	arma.get_node("Arma_Sprite").hide()
	get_tree().paused = true
	pass

func on_evol_quit():
	self.z_index = z_index - 20
	$Jugador_Sprite.show()
	arma.get_node("Arma_Sprite").show()
	spriteLvlUp.visible = true
	animLvlUp.play("LVL_UP")
	pass

func actualiza_atributos(atributos, evol):
	evolucion_actual = evolucion_actual + "_" + evol
	incremento_damage(atributos.damage)
	incremento_vida(atributos.vida)
	if vida > vida_max:
		vida = vida_max
	incremento_cadencia(atributos.cadencia)
	incremento_velocidad(atributos.velocidad)
	incremento_rango(atributos.rango)
	#aca pondriamos las caracteristicas especiales de la evol
	call(atributos.nombre)	
	arma.cambia_skin(atributos.arma)

func damage():
	pass

func cadencia():
	pass

	

	
func cadencia_velocidad():
	puede_correr = true

func cadencia_cadencia():
	arma.set_dispersion_angular(5)

func damage_rango():
	arma.set_cant_atraviesa(3)
	arma.incrementa_velocidad_proyectil(2)

func damage_rango_rango():
	arma.set_cant_atraviesa(5)
	arma.incrementa_velocidad_proyectil(2)

func damage_rango_explosivo():
	arma.cambia_proeyctil("Cohete")
	
func damage_proyectiles():
	arma.mas_proyectiles(3)
	arma.set_dispersion_angular(30)

func damage_proyectiles_proyectiles():
	arma.mas_proyectiles(5)
	arma.cambia_proeyctil("Proyectil_Rebota")
	arma.set_cant_atraviesa(2)

func damage_proyectiles_360():
	arma.mas_proyectiles(10)
	arma.set_dispersion_angular(360)

# -------------------------------------------------------------------------------------
# ------------------------------ MANEJO DE LA PAUSA -----------------------------------
# -------------------------------------------------------------------------------------

func pausa():
	if paused == null:
		self.z_index = z_index + 20
		paused = load("res://producto/assets/scenes/MenuPausa.tscn").instance()
		btn_pausa.disabled = true
		btn_pausa.visible = false
		paused.connect("continuar",self, "on_paused_quit")
		$Jugador_Sprite.hide()
		$Lvp_up.hide()
		arma.get_node("Arma_Sprite").hide()
		
		#no se como hacer para que el menu de pausa se ponga bien
		self.add_child(paused)
		menu_pausa = get_node("MenuPausa")
		menu_pausa.raise()
		menu_pausa.rect_position = $Control/pos_pausa.position
		menu_pausa.rect_size = Vector2(2048,1200)
		get_tree().paused = true

func _on_Btn_pausa_pressed():
	pausa()

func on_paused_quit():
	self.z_index = z_index - 20
	$Jugador_Sprite.show()
	if subiendo_nivel:
		$Lvp_up.show()
	arma.get_node("Arma_Sprite").show()
	paused = null

func guardar_monedas():
	var monedas = Engine.get_meta("monedas")
	monedas += puntos
	Engine.set_meta("monedas",monedas)
	var file = File.new()
	file.open(SAVE_PATH,File.READ)
	var skins_cargados = parse_json(file.get_line())
	skins_cargados[0].valor = Engine.get_meta("monedas")
	file.close()
	file.open(SAVE_PATH, File.WRITE)
	file.store_line(to_json(skins_cargados))
	file.close()
