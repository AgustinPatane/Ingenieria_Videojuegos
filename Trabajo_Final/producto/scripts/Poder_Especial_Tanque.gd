extends Sprite

onready var jugador = get_parent()

func _ready():
	pass

func escudo():
	jugador.tanque = true
