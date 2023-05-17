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
		
		# fixed scuffed rotation function
		
		# no longer just flipping the Sprite2D child node
		# previously only flipped Sprite2D node, fixed to flip the entire node by calling "self"
		# finally figured out why calling CharacterBody2D to flip does not work, just use "self" next time
		# note that ($Sprite2D.flip_h and .flip_v can still come in handy to make sprite point to different direction)
		# .flip_h or .flip_v use boolean
		# $ sign mean get node, $Sprite2D means get sprite2d child node of current node
		
		if velocity.x != 0:
			if velocity.x < 0:
				self.rotation_degrees = 270
			else:
				self.rotation_degrees = 90
				# since horizontal flip does not make notable difference (sprite shape kind of mirrored vertically)
				# if less than 0 = true means left and vice versa
		elif velocity.y != 0:
			if velocity.y < 0:
				self.rotation_degrees = 0
			# set rotation back to neutral
			else:
				self.rotation_degrees = 180
			# fully handle pointing direction with rotation_degrees for now
			# top of the sprite (top of the head) is "forward"
		
		# attached Marker2D node with sprite, finally usable pointing direction
			
	else:
		velocity = Vector2.ZERO
		# velocity.x = move_toward(velocity.x, 0, SPEED)
		# velocity.y = move_toward(velocity.y, 0, SPEED)
		# velocity.x = 0 and velocity.y = 0 also works
		# velocity = velocity * 0 also works, velocity = 0 does not work
		# velocity = Vector2(0,0)

	move_and_slide()
	

