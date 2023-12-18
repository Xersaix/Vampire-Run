extends CharacterBody2D

var speed = 400.0
var jump_speed = -600
var gravity = 1500
var state


func _ready():
	state = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	if is_on_floor():
		state.travel('run')
		$Sprite2D.scale.x = 1
		$CollisionShape2D.position.x = 0	
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		state.travel('jump')
		velocity.y = jump_speed
		


	
	velocity.x = 1 * speed

	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "tomb":
			position = Vector2(147,543)

func _on_run_end_body_entered(body):
	position = Vector2(147,543)

