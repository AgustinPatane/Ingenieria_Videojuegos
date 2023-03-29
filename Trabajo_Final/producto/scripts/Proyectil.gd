extends Area2D

var direction = Vector2.RIGHT
var speed = 800

func _ready():
	pass

func _process(delta):
	translate(direction.normalized() * speed * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

