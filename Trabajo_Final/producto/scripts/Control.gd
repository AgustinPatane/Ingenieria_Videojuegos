extends Control



onready var capsula := get_node("/root/"+Engine.get_meta("nombre_escena_mapa")+"/Capsula/Sprite_Base")
onready var indicador := $Indicador 
var jugador

var blinkSpeed = 1.0
var isBlinking = true

func _ready():
	jugador = get_node("/root/"+Engine.get_meta("nombre_escena_mapa")+"/Jugador")
	capsula.material.set_shader_param("luminosity_amount", 0.0)



func _process(delta):
	
	if jugador.experiencia>=jugador.experiencia_necesaria:
		indicador.visible=true
		$Label.visible=true
		$Shift.visible=true
		print(capsula.position)
		var diff = capsula.position.y-jugador.position.y
		var direction = capsula.position - jugador.position
		direction.y-=620
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




	