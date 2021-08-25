extends KinematicBody2D

export var speed = 150
export var friction = 6
export var acceleration = 3

var velocity = Vector2()

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
		velocity = lerp(velocity, direction.normalized() * speed, acceleration * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction * delta)
	
	velocity = move_and_slide(velocity)
