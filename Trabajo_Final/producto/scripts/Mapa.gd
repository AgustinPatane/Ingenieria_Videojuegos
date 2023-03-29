extends Node2D

export(int) var tiempo_spawn = 300
var a = 0
onready var escena_enemigo = preload("res://producto/assets/scenes/Enemigo.tscn")

func _ready():
	randomize()

func spawn_enemigo():
	var posx = randi() % 1025
	var posy = randi() % 600
	var enemigo = escena_enemigo.instance()
	enemigo. position = Vector2(posx,posy)
	get_tree().get_root().add_child(enemigo)


func _process(_delta):
	if a%tiempo_spawn == 0:
		spawn_enemigo()
	a+=1
