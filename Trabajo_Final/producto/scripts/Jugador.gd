extends KinematicBody2D

# -------------------------------------------------------------------------------------
# ------------------------------------- NODOS -----------------------------------------
# -------------------------------------------------------------------------------------

onready var arma = get_node("Arma")
onready var spriteLvlUp = get_node("Lvp_up")
onready var animLvlUp = get_node("Lvp_up/Anim_lvl_up")

onready var mascota = get_node("Mascota")
onready var anim_mascota = get_node("Mascota/Path2D/PathFollow2D/AnimationPlayer")

# -------------------------------------------------------------------------------------
# ----------------------------------- VARIABLES ---------------------------------------
# -------------------------------------------------------------------------------------

var motion = Vector2()
var SPEED = 0
var puntos = 0
var vida 
var experiencia = 0
var nivel = 1
var experiencia_necesaria
var paused = null
var menu_pausa
var subiendo_nivel = false
var niveles_evol
var puede_correr = false
var skin_body
var skin_arma

# -------------------------------------------------------------------------------------
# -------------------------------- CARACTERISTICAS ------------------------------------
# -------------------------------------------------------------------------------------

var vida_max
var vel_walk 
var vel_run
var evolucion_actual = "evolucion"

# -------------------------------------------------------------------------------------
# ------------------------------------ CONSTANTES ----------------------------------------
# -------------------------------------------------------------------------------------

const SAVE_PATH = "res://Saves/tienda.sav"

# -------------------------------------------------------------------------------------
# ------------------------------------ SIGNALS ----------------------------------------
# -------------------------------------------------------------------------------------

signal player_defeated
signal level_up(nivel)
signal player_ready
signal actualiza_interfaz

# -------------------------------------------------------------------------------------
# ----------------------------------- FUNCIONES ---------------------------------------
# -------------------------------------------------------------------------------------

func _ready():
	set_atributos()
	preparo_futuras_evoluciones()
	$Sombra.modulate = Color(1,1,1,0.5)
	var ruta = Engine.get_meta("ruta_skin")
	skin_body = load(ruta + "/body.png")
	skin_arma = load(ruta + "/arma_1.png")
	$Jugador_Sprite.set_texture(skin_body)
	$Arma/Arma_Sprite.set_texture(skin_arma)
	$AnimationPlayer_body.play("idle")
	spriteLvlUp.visible = false
	self.z_index = get_parent().get_child_count() + 1
	emit_signal("player_ready")
	
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
	if $Mascota/Path2D/PathFollow2D/sprite.position.x< 0 :
		$Mascota/Path2D/PathFollow2D/sprite.set_flip_h(true)
	else:
		$Mascota/Path2D/PathFollow2D/sprite.set_flip_h(true)
	
# -------------------------------------------------------------------------------------
# ---------------------------- MANEJO ATRIBUTOS PERSONAJE -----------------------------
# -------------------------------------------------------------------------------------

func set_atributos():
	var atrib = Atributos.get_atrib_jugador()
	experiencia_necesaria = atrib.exp_necesaria
	set_vida_max(atrib.vida_max)
	vida = vida_max
	set_cadencia_disparo(atrib.cadencia_disparo)
	set_danio_Arma(atrib.danio)
	set_rango(atrib.rango)
	set_velocidad(atrib.speed)
	set_cant_atraviesa(atrib.cant_atraviesa)
	set_vel_proyectil(atrib.speed_proyectil)
	set_cant_proyectiles(atrib.cant_proyectiles)
	niveles_evol = atrib.niveles_evol

func get_exp():
	return experiencia

func set_cant_proyectiles(val):
	arma.set_cant_proyectiles(val)

func set_vel_proyectil(val):
	arma.set_velocidad_proyectil(val)

func set_cant_atraviesa(val):
	arma.set_cant_atraviesa(val)

func get_vida_max():
	return vida_max

func get_vida():
	return vida

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

func get_danio_Arma():
	return arma.get_damage_Arma()

func set_danio_Arma(value):
	arma.set_damage_Arma(value)

func incremento_danio(porcentaje):
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
	emit_signal("actualiza_interfaz")
	if vida<=0:
		Engine.set_meta("Puntaje",puntos)
		emit_signal("player_defeated")
		guardar_monedas()
	
func recupera_vida(cant):
	if (vida+cant) <= vida_max: vida+=cant

# -------------------------------------------------------------------------------------
# --------------------------- EXPERIENCIA y PUNTAJE -----------------------------------
# -------------------------------------------------------------------------------------

func gana_puntos(cantidad):
	puntos += cantidad
	emit_signal("actualiza_interfaz")

func gana_exp(value):
	experiencia += value
	if experiencia_necesaria <= experiencia:
		nivel += 1
		emit_signal("level_up",nivel)
		if nivel == niveles_evol[0] or nivel == niveles_evol[1] or nivel == niveles_evol[2]:
			_evolucion()
		else:
			_adquiere_habilidad()
		
		experiencia = 0
		puntos += nivel * 25
		experiencia_necesaria = actualiza_exp(experiencia_necesaria)
		subiendo_nivel = true
		vida_max += 5
		vida += round(vida_max * 0.1)
		if vida > vida_max: vida= vida_max
	emit_signal("actualiza_interfaz")

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
	$Interfaz.esconder()
	spriteLvlUp.visible =false
	var evol_instance = load("res://producto/assets/scenes/MenuEvolucion.tscn").instance()
	self.z_index = z_index + 20
	self.add_child(evol_instance)
	var menu_evol = get_node("MenuEvolucion")
	menu_evol.raise()
	var pos_evol = get_viewport().size
	menu_evol.rect_position = Vector2(-1* pos_evol.x/2 ,-1* pos_evol.y/2)
	menu_evol.rect_size = pos_evol
	$Jugador_Sprite.hide()
	arma.get_node("Arma_Sprite").hide()
	get_tree().paused = true
	pass

func on_evol_quit():
	$Interfaz.mostrar()
	self.z_index = z_index - 20
	$Jugador_Sprite.show()
	arma.get_node("Arma_Sprite").show()
	spriteLvlUp.visible = true
	animLvlUp.play("LVL_UP")
	emit_signal("actualiza_interfaz")
	pass

func actualiza_atributos(atributos, evol):
	evolucion_actual = evolucion_actual + "_" + evol
	incremento_danio(atributos.damage)
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

func cadencia_cadencia_doblearma():
	pass

func cadencia_cadencia_boomerang():
	pass

func cadencia_velocidad_atraviesamuros():
	pass

func cadencia_velocidad_freeze():
	$Timer_evolucion112.set_process(true)
	$Timer_evolucion112.start()


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
	arma.mas_proyectiles(0)
	#arma.set_dispersion_angular(30)

func damage_proyectiles_proyectiles():
	arma.mas_proyectiles(5)
	arma.cambia_proeyctil("Proyectil_Rebota")
	arma.set_cant_atraviesa(2)

func damage_proyectiles_doblearma():
	$Arma2.set_process(true)
	$Arma2.visible = true
	$Arma2.position.y += 20
	set_atributos()
	pass


func damage_proyectiles_360():
	arma.mas_proyectiles(10)
	arma.set_dispersion_angular(360)

# -------------------------------------------------------------------------------------
# ------------------------------ MANEJO DE LA PAUSA -----------------------------------
# -------------------------------------------------------------------------------------

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


#---------------------------------------- MASCOTA ---------------------------

func damage_proyectiles_mascota():
	mascota.set_process(true)
	mascota.visible = true
	anim_mascota.play("move")
	pass

func _on_Area2D_Mascota_area_entered(area):
	anim_mascota.play("ataque")

func _on_Area2D_Mascota_area_exited(area):
	anim_mascota.play("move")

#---------------------------------------- MASCOTA ---------------------------
func preparo_futuras_evoluciones():
	$Arma2.set_process(false)
	$Arma2.visible = false
	mascota.set_process(false)
	$Timer_evolucion112.set_process(false)
	Engine.set_meta("freeze","false")
	mascota.visible = false

func _on_Timer_timeout():
	Engine.set_meta("freeze","true")
	$Timer_freeze.start()

func _on_Timer_freeze_timeout():
	Engine.set_meta("freeze","false")
