extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var coins = 0

@onready var score_label = $CanvasLayer/scorelabel

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	move_and_slide()

	if position.y > 1000:
		die()

func collect_coin():
	coins += 1
	score_label.text = "Coins: " + str(coins)

func die():
	get_tree().call_deferred("reload_current_scene")
