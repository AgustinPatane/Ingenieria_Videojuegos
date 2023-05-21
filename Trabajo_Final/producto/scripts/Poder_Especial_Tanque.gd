extends Sprite

var tipo = ""
onready var jugador = get_parent()

func _ready():
	pass

func escudo():
	jugador.poder_en_uso = true

func set_tipo(tipo_poder):
	tipo = tipo_poder
