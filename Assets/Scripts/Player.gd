
extends KinematicBody2D

const GRAVITY = 700.0
var velocity = Vector2()
var speed_x = 0
var speed_y = 0

const JUMP_FORCE = 450

func _fixed_process(delta):
	
	if Input.is_action_pressed("jump"):
		speed_y = -JUMP_FORCE
		speed_x = 30
	speed_y += delta * GRAVITY
	
	velocity.x = speed_x * delta
	velocity.y = speed_y * delta * 2
	move( velocity )

func _ready():
    set_fixed_process(true)