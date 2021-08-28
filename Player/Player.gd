extends KinematicBody2D

export var speed = 100
export var friction = 10
export var acceleration = 5

var velocity = Vector2()

onready var animationPlayer = $AnimationPlayer

func get_input():
	var input = Vector2.ZERO
	var input_right = Input.get_action_strength("ui_right")
	var input_left = Input.get_action_strength("ui_left")
	var input_up = Input.get_action_strength("ui_up")
	var input_down = Input.get_action_strength("ui_down")
	
	input.x = input_right - input_left
	input.y = input_down - input_up
	
	return input

func _physics_process(delta):
	var direction = get_input()
	
	if direction != Vector2.ZERO:
		if direction.x > 0:
			animationPlayer.play("RunRight")
		else:
			animationPlayer.play("RunLeft") 
		velocity = lerp(velocity, direction.normalized() * speed, acceleration * delta)
	else:
		animationPlayer.play("IdleRight")
		velocity = lerp(velocity, Vector2.ZERO, friction * delta)
	
	velocity = move_and_slide(velocity)
