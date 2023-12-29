extends CharacterBody3D

const ACCELERATION = 100.0
const FRICTION = 10.0
const SPEED_SCALING = Vector3.ONE / Globals.scale
const JUMP_VELOCITY = 20.0
const MOVING_THRESH = 0.3

# Player specific gravity value.
var gravity = 50

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x -= velocity.x * FRICTION * SPEED_SCALING.x * delta
	velocity.z -= velocity.z * FRICTION * SPEED_SCALING.z * delta
	if direction:
		velocity.x += direction.x * ACCELERATION * delta * SPEED_SCALING.x
		velocity.z += direction.z * ACCELERATION * delta * SPEED_SCALING.z
	move_and_slide()
	position = position.snapped(Globals.snap)
