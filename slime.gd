extends Area2D

const SPEED = 25.0
@export var patrol_distance = 48.0

var direction = 1
var start_x = 0.0

func _ready():
	start_x = position.x
	body_entered.connect(_on_body_entered)

func _process(delta):
	position.x += direction * SPEED * delta
	if position.x > start_x + patrol_distance:
		direction = -1
	elif position.x < start_x - patrol_distance:
		direction = 1
	$Sprite2D.flip_h = direction < 0

func _on_body_entered(body):
	if body.has_method("die"):
		body.die()
