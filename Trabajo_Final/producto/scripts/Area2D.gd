extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_CollisionShape2D_body_entered(body):
	if body.name == "Jugador":
		print("El jugador entró en el área de detección.")
