extends KinematicBody2D

# -------------------------------------------------------------------------------------
# ------------------------------------- NODOS -----------------------------------------
# -------------------------------------------------------------------------------------

onready var arma = get_node("Arma")
onready var spriteLvlUp = get_node("Lvp_up")
onready var animLvlUp = get_node("Lvp_up/Anim_lvl_up")

onready var mascota = get_node("Mascota")
onready var anim_mascota = get_node("Mascota/Path2D/PathFollow2D/AnimationPlayer")

onready var poder_especial_seleccionado = get_node("Poder_Especial_")
onready var timer_carga = get_node("Poder_Especial_/timer_de_carga")
onready var timer_con_poder = get_node("Poder_Especial_/timer_con_poder")
onready var sprite_poder = get_node("Poder_Especial_/sprite_poder")
onready var efecto_Congelacion = get_node("Efecto_Congelacion")
onready var timer_regeneracion = get_node("Timer_Regeneracion")
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

var poder_en_uso = false
var pedir_poder = false
var poder_especial = ""
var factor_resiliencia = 1
var resiliencia = false
var token = false
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
signal freeze
signal mascota
signal explosion

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
		SoundManager.play_pasos()
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
		recibe_ataque(0.05)
	if Input.is_action_pressed("poder_especial"):
		ejecutar_poder_especial()
	
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
	if poder_especial != "escudo" or poder_en_uso == false:
		if resiliencia == true and self.vida<30:
			vida-=danio*(factor_resiliencia*0.1)
		else:
			vida-=danio*factor_resiliencia
	emit_signal("actualiza_interfaz")
	if vida<=0:
		if token == false:
			Engine.set_meta("Puntaje",puntos)
			emit_signal("player_defeated")
			guardar_monedas()
		else:
			rellenar_vida()
			token = false


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


#____________ EVOLUCIONES DE MOVIMIENTO ________________
func movimiento():
	print("movimiento")
	pass

func movimiento_enemigos():
	print("movimiento_enemigos")
	pass

func movimiento_propio():
	print("movimiento_propio")
	pass

func movimiento_enemigos_ondaralentizadora():
	print("movimiento_enemigos_ondaralentizadora")
	poder_especial = "onda_ralentizadora"
	pass

func movimiento_enemigos_congelacion():
	poder_especial = "hielo"
	habilito_poder_especial()
	activar_poder_especial(poder_especial)
	print("movimiento_enemigos_congelacion")
	#$Timer_evolucion112.set_process(true)
	#$Timer_evolucion112.start()
	pass

func movimiento_propio_atravesarmuros():
	print("movimiento_propio_atravesarmuros")
	pass

func movimiento_propio_nitro():
	poder_especial = "rayo"
	habilito_poder_especial()
	activar_poder_especial(poder_especial)
	print("movimiento_propio_nitro")
	pass

#____________ EVOLUCIONES DE SALUD ________________

func salud():
	rellenar_vida()
	print("salud")
	pass

func salud_masvida():
	rellenar_vida()
	print("salud_masvida")
	pass

func salud_masinmune():
	factor_resiliencia = 0.5
	print("salud_masinmune")
	pass

func salud_masvida_tokenvidaextra():
	token = true
	print("salud_masvida_tokenvidaextra")
	pass

func salud_masvida_regeneracion():
	timer_regeneracion.start()
	print("salud_masvida_regeneracion")
	pass

func salud_masinmune_escudo():
	poder_especial = "escudo"
	habilito_poder_especial()
	activar_poder_especial(poder_especial)
	print("salud_masinmune_escudo")
	pass

func salud_masinmune_resiliente():
	resiliencia = true
	print("salud_masinmune_resiliente")
	pass

func rellenar_vida():
	self.vida = self.vida_max
	pass

#____________ EVOLUCIONES DE ATAQUE ________________

func ataque():
	print("ataque")
	pass

func ataque_cerca():
	print("ataque_nose")
	pass

func ataque_oneshoot():
	print("ataque_oneshoot")
	arma.set_cant_atraviesa(3)
	arma.incrementa_velocidad_proyectil(2)
	pass

func ataque_cerca_areaexplosiva():
	poder_especial = "bomba"
	habilito_poder_especial()
	activar_poder_especial(poder_especial)
	print("ataque_cerca_areaexplosiva")
	pass

func ataque_cerca_penetramuros():
	print("ataque_cerca_penetramuros")
	arma.set_cant_atraviesa(5)
	arma.incrementa_velocidad_proyectil(2)
	pass

func ataque_oneshoot_francotirador():
	print("ataque_oneshoot_francotirador")
	pass

func ataque_oneshoot_bazooka():
	print("ataque_oneshoot_bazooka")
	arma.cambia_proeyctil("Cohete")
	pass

#____________ EVOLUCIONES DE TIRO ________________

func tiro():
	print("tiro")
	pass

func tiro_dispersion():
	print("tiro_dispersion")
	arma.set_dispersion_angular(5)
	pass

func tiro_cadencia():
	print("tiro_cadencia")
	pass

func tiro_dispersion_rebote():
	print("tiro_dispersion_rebote")
	arma.mas_proyectiles(5)
	arma.cambia_proeyctil("Proyectil_Rebota")
	arma.set_cant_atraviesa(2)
	pass

func tiro_dispersion_360():
	print("tiro_dispersion_360")
	arma.mas_proyectiles(10)
	arma.set_dispersion_angular(360)
	pass

func tiro_cadencia_doblearma():
	print("tiro_cadencia_doblearma")
	$Arma2.set_process(true)
	$Arma2.visible = true
	$Arma2.position.y += 20
	set_atributos()
	pass

func tiro_cadencia_infinita():
	poder_especial = "balas"
	habilito_poder_especial()
	activar_poder_especial("balas")
	print("tiro_cadencia_infinita")
	pass


# _-_-_-_-_-_-_-_-_- FIN EVOLUCIONES


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

func _on_Area2D_Mascota_area_entered(_area):
	anim_mascota.play("ataque")

func _on_Area2D_Mascota_area_exited(_area):
	anim_mascota.play("move")

#---------------------------------------- FIN MASCOTA ---------------------------

#-------------------------- PODER ESPECIAL --------------------------
func preparo_futuras_evoluciones():
	$Arma2.set_process(false)
	$Arma2.visible = false
	mascota.set_process(false)
	Engine.set_meta("freeze","false")
	mascota.visible = false
	desactivo_poder_especial()

func desactivo_poder_especial():
	$Poder_Especial_.set_process(false)
	$Poder_Especial_.visible = false
	timer_carga.set_process(false)
	timer_con_poder.set_process(false)
	sprite_poder.set_process(false)

func habilito_poder_especial():
	$Poder_Especial_.set_process(true)
	$Poder_Especial_.visible = true
	timer_carga.set_process(true)
	timer_con_poder.set_process(true)
	sprite_poder.set_process(true)
	poder_especial_seleccionado.set_tipo(poder_especial)

func activar_poder_especial(poder_especial):
	sprite_poder.play("carga_"+poder_especial)
	timer_carga.start()

#	poder_tanque.set_process(true)
#	poder_tanque.escudo()
func ejecutar_poder_especial():
	if pedir_poder == true:
		pedir_poder = false
		poder_especial_seleccionado.activar()
		timer_con_poder.start()
		sprite_poder.play("usandose_"+poder_especial)


#--------------------------  fin PODER ESPECIAL --------------------------


func _on_timer_de_carga_timeout():
	print("PODER CARGADO")
	sprite_poder.play("cargado_"+poder_especial)
	self.pedir_poder = true


func _on_timer_con_poder_timeout():
	self.poder_en_uso = false
	timer_carga.start()
	sprite_poder.play("carga_"+poder_especial)
	poder_especial_seleccionado.timeout()


func _on_Timer_Regeneracion_timeout():
	if self.vida+5 <= self.vida_max:
		self.vida+=5
	else:
		rellenar_vida()

func bomba_explosion():
	emit_signal("explosion")

