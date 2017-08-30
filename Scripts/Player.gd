extends KinematicBody2D

onready var ground_ray = get_node("ground_ray")
onready var sprite = get_node("sprite")

# Physics config
const GRAVITY = 700
const JUMP_FORCE = -500

var speed_x = 0
var speed_y = 0
var velocity = Vector2()
var motion

# Powerbar & Jumping
var powerBar = 0
onready var powerBarProgress = preload("res://Scenes/PowerJumpBar.tscn")
var powerBarVal
var jumping = true # we are starting with jumping - (may be not. we can change this in future)

# Animation
var anim = "idle"

var input

func _ready():
	# Get instance of powerBar and hide for default
	powerBarVal = powerBarProgress.instance()
	add_child(powerBarVal)
	powerBarVal.hide()
	
	# Set
	set_process_input(true)
	set_fixed_process(true)
	
	
func _input(event):
	# Aaand, let's jump!
	if event.is_action_released("ui_select"):
		set_process_input(false)
		speed_y = JUMP_FORCE
		speed_x = powerBarVal.get_value()
		powerBarVal.set_value(0)
		powerBarVal.hide()

# Physics goes here!
func _fixed_process(delta):
	
	# If input pressed, set powerBar for release
	if Input.is_action_pressed("ui_select"):
		prepareToJump()
		
	# Set gravity
	speed_y += delta * GRAVITY
	
	velocity.x = speed_x * delta * 2
	velocity.y = speed_y * delta * 2
	
	motion = move(velocity)
	
	if is_colliding():
		
		set_process_input(true) # allow player to jump
		
		# Slide motion for realistic physics
		var normal = get_collision_normal()
		motion = normal.slide(motion)
		velocity = normal.slide(velocity)

		print("ÖLDÜN")
		velocity.y = 0
	
	# Set animation
	if velocity.y == 0:
		anim = "idle"
	else:
		anim = "jump"
		
	print(velocity.y)
		
	sprite.play(anim)
	
func prepareToJump():
	if is_processing_input():
		powerBarVal.show()
		powerBarVal.set_value(powerBarVal.get_value() + 2)
		anim = "hold_jump"
	
#func jump(speed):
#	velocity.y = speed