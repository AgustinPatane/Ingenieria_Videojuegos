extends CanvasLayer

var paused
var menu_pausa
var jugador

var tiempo_juego = Atributos.tiempos.juego
var minutos = int(tiempo_juego / 60)
var segundos = tiempo_juego % 60
var opacidad = 1
var tiempo_ultima_pausa = 0

func _ready():
	$Transicion.visible = true
	$Barra_evol.visible = false
	$Tiempo_restante.text = ""
	if(Engine.get_meta("contrarreloj")):
		var timer_juego = Timer.new()
		self.add_child(timer_juego)
		timer_juego.wait_time = 1
		timer_juego.connect("timeout", self, "update_timer",[-1])
		timer_juego.start()
		set_label_tiempo_restante()


func set_label_tiempo_restante():
	var string_seg
	var string_min
	
	if segundos < 10:
		string_seg =  ":0" + str(segundos)
	else:
		string_seg =  ":" + str(segundos)
	
	if minutos < 10:
		string_min =  "0" + str(minutos)
	else:
		string_min =  str(minutos)
		
	$Tiempo_restante.text = string_min + string_seg

func update_timer(value):
	# Calcula el nuevo tiempo en segundos
	var nuevo_tiempo = minutos * 60 + segundos + value
	
	# Actualiza los minutos y segundos en base al nuevo tiempo
	minutos = nuevo_tiempo / 60
	segundos = nuevo_tiempo % 60
	
	# Asegúrate de que los minutos y segundos estén en el rango correcto
	if segundos < 0:
		segundos += 60
		minutos -= 1
	elif segundos >= 60:
		segundos -= 60
		minutos += 1
	
	# Actualiza la etiqueta del tiempo restante
	set_label_tiempo_restante()
	
	# Verifica si el tiempo ha alcanzado cero
	if minutos < 0:
		get_parent().muere()
	
func _process(_delta):
	if(opacidad > 0):
		$Transicion.modulate = Color(1,1,1,opacidad)
		opacidad -= 0.01
	elif has_node("Transicion"):
		$Transicion.queue_free()
	
	var cond_pausa = tiempo_ultima_pausa + 0.5 <= OS.get_ticks_msec() / 1000.0
	if Input.is_action_pressed("ui_cancel") and cond_pausa:
		pausa()
	$Barra_evol.value += 1 

func esconder():
	self.visible = false

func mostrar():
	self.visible = true

func pausa():
	if paused == null:
		Atributos.set_cursor_menu()
		paused = load("res://producto/assets/scenes/MenuPausa.tscn").instance()
		paused.connect("continuar",self, "on_paused_quit")
		self.add_child(paused)
		menu_pausa = get_node("MenuPausa")
		menu_pausa.jugador = jugador
		menu_pausa.cambia_skin()
		get_tree().paused = true

func _on_Btn_pausa_pressed():
	pausa()

func on_paused_quit():
	Atributos.set_cursor_juego()
	tiempo_ultima_pausa = OS.get_ticks_msec() / 1000.0
	paused = null

func actualiza():
	$Vida.text = " " + str(floor(jugador.vida)) + "/"+ str(jugador.vida_max)
	$Control/Barra_exp.max_value = jugador.experiencia_necesaria
	$Control/Barra_exp.value = jugador.experiencia
	$Control/Barra_vida.max_value = jugador.vida_max
	$Control/Barra_vida.value = jugador.vida
	$Nivel.text = " Lvl: " + str(jugador.nivel)
	$Puntaje.text = str(jugador.puntos)
	

func _on_Jugador_player_ready():
	jugador = get_parent()
	$Control/Sprite.set_texture(load(Engine.get_meta("ruta_skin") + "/head.png"))
	actualiza()

func _on_Jugador_actualiza_interfaz():
	actualiza()

func _on_Jugador_actualiza_tiempo(tiempo):
	update_timer(tiempo)





func aumenta_evol(_delta):
	if $Barra_evol.value < 101:
		get_node("Barra_evol").visible = true
		$Barra_evol.value += Atributos.tiempos.evol / 100
	else: 
		get_node("Barra_evol").visible = false
		#get_node("Interfaz/Barra_evol").value = 0

func decrementa_evol():
	get_node("Barra_evol").visible = false
	get_node("Barra_evol").value = 0



