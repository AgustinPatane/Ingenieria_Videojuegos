extends CanvasLayer

var paused
var menu_pausa
var jugador

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
		menu_pausa.rect_position = $Pos_pausa.position
		menu_pausa.rect_size = get_viewport().size
		get_tree().paused = true

func _on_Btn_pausa_pressed():
	pausa()

func on_paused_quit():
	paused = null

func actualiza():
	$Vida.text = " " + str(jugador.vida) + "/"+ str(jugador.vida_max)
	$Control/Barra_exp.max_value = jugador.experiencia_necesaria
	$Control/Barra_exp.value = jugador.experiencia
	$Control/Barra_vida.max_value = jugador.vida_max
	$Control/Barra_vida.value = jugador.vida
	$Nivel.text = " Lvl: " + str(jugador.nivel)
	$Puntaje.text = str(jugador.puntos)

func _on_Jugador_player_ready():
	jugador = get_parent()
	actualiza()

func _on_Jugador_actualiza_interfaz():
	actualiza()
