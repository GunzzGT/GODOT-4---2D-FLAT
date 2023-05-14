extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# no gravity, no jumping yet
# delta can also be understood as "on button press hold"
# move_toward is fancy Vector * 0

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(0,0)
		# velocity.x = move_toward(velocity.x, 0, SPEED)
		# velocity.y = move_toward(velocity.y, 0, SPEED)
		# velocity.x = 0 and velocity.y = 0 also works
		# velocity = velocity * 0 also works, velocity = 0 does not work
		# velocity = Vector2(0,0)

	move_and_slide()
