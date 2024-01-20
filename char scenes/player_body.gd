extends CharacterBody3D

const ACCELERATION = 100.0
const FRICTION = 10.0
const SPEED_SCALING = Vector3.ONE / Globals.scale
const JUMP_VELOCITY = 30.0
const MOVING_THRESH = 3.0

# Player specific gravity value.
var gravity = 100

# Animations
@onready var sprite: AnimatedSprite3D = $PlayerAnimation
enum state_t {walking, attacking}
var player_state = state_t.walking

func _animate():
	match player_state:
		state_t.walking:

			if velocity.length() > MOVING_THRESH:
				sprite.flip_h = velocity.x < 0
				sprite.play("walk")
			else:
				sprite.play("idle")

		state_t.attacking:
			pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x -= velocity.x * FRICTION * SPEED_SCALING.x * delta
	velocity.z -= velocity.z * FRICTION * SPEED_SCALING.z * delta
	if direction:
		velocity.x += direction.x * ACCELERATION * delta * SPEED_SCALING.x
		velocity.z += direction.z * ACCELERATION * delta * SPEED_SCALING.z
	move_and_slide()
	# position = position.snapped(Globals.snap)

	_animate()
