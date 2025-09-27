extends CharacterBody2D


@export var SPEED = 300.0
@export var gravMult = 2
@export var JUMP_VELOCITY = -400.0*gravMult
@export var maxSpeed = 100
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += gravMult*get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if abs(velocity.x)<maxSpeed:
		if direction:
			velocity.x += direction * SPEED
		elif is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED*0.9)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
