extends CanvasLayer

var paused
var menu_pausa
var jugador

var tiempo_juego = Atributos.tiempos.juego
var minutos = int(tiempo_juego / 60)
var segundos = tiempo_juego % 60

func _ready():
	$Tiempo_restante.text = ""
	if(Engine.get_meta("contrarreloj")):
		var timer_juego = Timer.new()
		self.add_child(timer_juego)
		timer_juego.wait_time = 1
		timer_juego.connect("timeout", self, "update_timer")
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

func update_timer():
	segundos -= 1
	if segundos <= 0:
		minutos -= 1
		segundos = 59
		
	set_label_tiempo_restante()
	
	if minutos < 0:
		get_parent().muere()
	
func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		pausa()

func esconder():
	self.visible = false

func mostrar():
	self.visible = true

func pausa():
	if paused == null:
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
