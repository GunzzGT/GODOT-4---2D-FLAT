extends CharacterBody2D

const SPEED = 300.0
const JUMP = -400.0 # not used

# no gravity, no jumping yet
# delta can also be understood as "on button press hold"
# move_toward is fancy Vector * 0

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	# look_at(get_global_mouse_position())
	# look_at actually works to alter the entire node direction, "right" or 270 degree angle is the forward by default

	if direction:
		velocity = direction * SPEED
		
		# scuffed function to determine sprite rotation
		# not direction because I don't know how to define which is forward or backwards from the node
		if velocity.x != 0:
			# vertical flip false should not be needed here actually ($Sprite2D.flip_v = false) deleted
			if velocity.x < 0:
				$Sprite2D.rotation_degrees = 90
			else:
				$Sprite2D.rotation_degrees = 270
				# since horizontal flip does not make notable difference (sprite shape kind of mirrored vertically)
				# if less than 0 = true means left and vice versa
		elif velocity.y != 0:
			$Sprite2D.rotation_degrees = 0
			# set rotation back to neutral
			$Sprite2D.flip_v = velocity.y > 0
			# flip vertically, for now decide that the top of the sprite (top of the head) is "forward" in sprite only, not actual usable direction
		
	else:
		velocity = Vector2.ZERO
		# velocity.x = move_toward(velocity.x, 0, SPEED)
		# velocity.y = move_toward(velocity.y, 0, SPEED)
		# velocity.x = 0 and velocity.y = 0 also works
		# velocity = velocity * 0 also works, velocity = 0 does not work
		# velocity = Vector2(0,0)

	move_and_slide()
	

