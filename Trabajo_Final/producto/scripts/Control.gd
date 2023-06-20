extends Control

onready var capsula := get_node("/root/"+Engine.get_meta("nombre_escena_mapa")+"/Capsula/Sprite_Base")
#no se porque verga no funciona
onready var pos_capsula = get_node("Position2D").position
onready var indicador := $Indicador 
var jugador

var blinkSpeed = 1.0
var isBlinking = true

func _ready():
	jugador = get_node("/root/"+Engine.get_meta("nombre_escena_mapa")+"/Jugador")
	capsula.material.set_shader_param("luminosity_amount", 0.0)
	indicador.visible=false
	$Label.visible=false
	$Shift.visible=false

func _process(delta):
	
	if jugador.experiencia>=jugador.experiencia_necesaria:
		indicador.visible=true
		$Label.visible=true
		$Shift.visible=true
	
		var diff = pos_capsula.y-jugador.position.y
		var direction = pos_capsula - jugador.position
		direction.y+=250
		var rotation = direction.angle()*180/3.14
		indicador.rotation_degrees=rotation
		parpadeo(delta)
	else:
		indicador.visible=false
		$Label.visible=false
		$Shift.visible=false
		capsula.material.set_shader_param("luminosity_amount", 0)

func parpadeo(delta):
	blinkSpeed += delta * 2  # Ajusta la velocidad del parpadeo según tus preferencias
	var blink = abs(sin(blinkSpeed))
	capsula.material.set_shader_param("luminosity_amount", blink*0.7)

