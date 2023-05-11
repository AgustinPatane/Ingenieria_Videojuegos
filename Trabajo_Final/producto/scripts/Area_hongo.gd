extends Area2D


var auxiliar = 0.5
var cond = false
var jugador_en_area = false
var danio
var jugador

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.modulate = Color(1,1,1,0.5)
	$AnimationPlayer.play("anim")

func desaparecer():
	while auxiliar > 0.1:
		$Sprite.modulate = Color(1,1,1,auxiliar)
		auxiliar -=  0.01
		yield(get_tree().create_timer(0.1),"timeout")
	queue_free()

func set_danio(val):
	danio = val

func ref_jugador(jug):
	jugador = jug

func _process(_delta):
	if jugador_en_area:
		jugador.recibe_ataque(danio)

func _on_Area_hongo_body_entered(body):
	if "Jugador" in body.name:
		jugador_en_area = true


func _on_Area_hongo_body_exited(body):
	if "Jugador" in body.name:
		jugador_en_area = false
