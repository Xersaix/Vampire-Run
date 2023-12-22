extends CharacterBody2D

var speed = 400.0
var jump_speed = -600
var gravity = 1500
var player_direction
var state



func _ready():
	state = $AnimationTree.get("parameters/playback")
	player_direction = 1

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	if is_on_floor():
		state.travel('run')
		$CollisionShape2D.position.x = 0	
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():

		velocity.y = jump_speed
		

	
	
	velocity.x = player_direction * speed

	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "tomb":
			velocity.x = 0
			state.travel("die")
			
			
			





func _on_animation_tree_animation_finished(die):
	position = Vector2(94,425)
