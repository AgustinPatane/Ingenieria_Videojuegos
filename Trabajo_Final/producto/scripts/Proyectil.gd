extends Area2D

var direction = Vector2.RIGHT
var speed = 800
var damage = 0 setget set_damage, get_damage

func get_damage():
	return damage

func set_damage(value):
	damage = value

func _ready():
	pass

func _process(delta):
	translate(direction.normalized() * speed * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

