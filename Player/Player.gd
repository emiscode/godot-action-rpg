extends KinematicBody2D

const FRICTION = 10
const MAX_SPEED = 100
const ACCELERATION = 10

var velocity = Vector2.ZERO

func _physics_process(delta):
	handle_input(delta)
	move_and_collide(velocity)
	
func handle_input(delta):
	var input_vector = Vector2.ZERO
	var input_right = Input.get_action_strength("ui_right")
	var input_left = Input.get_action_strength("ui_left")
	var input_up = Input.get_action_strength("ui_up")
	var input_down = Input.get_action_strength("ui_down")
	
	input_vector.x = input_right - input_left
	input_vector.y = input_down - input_up
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector.normalized() * MAX_SPEED * delta
		#velocity += input_vector.normalized() * ACCELERATION * delta		
		#velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		velocity = Vector2.ZERO
		#velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
