extends Control



onready var capsula := get_node("/root/"+Engine.get_meta("nombre_escena_mapa")+"/Capsula/Sprite_Base")
onready var indicador := $Indicador # Asegúrate de que el nombre coincida con el nodo correcto
var jugador

func _ready():
	jugador = get_node("/root/"+Engine.get_meta("nombre_escena_mapa")+"/Jugador")




func _process(delta):
	if jugador.experiencia>=jugador.experiencia_necesaria:
		indicador.visible=true
		$Label.visible=true
		var diff = capsula.position.y-jugador.position.y
		var direction = capsula.position - jugador.position
		direction.y-=160
		var rotation = direction.angle()*180/3.14
		indicador.rotation_degrees=rotation
	else:
		indicador.visible=false
		$Label.visible=false
