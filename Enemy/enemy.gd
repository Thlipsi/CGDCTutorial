extends CharacterBody2D

var SPEED = 300

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var player

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if chase:
		var direction = (player.position - self.position).normalized()
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
	move_and_slide()


func initialize(x, y):
	self.position = Vector2(x, y)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		chase = true
		player = body


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		chase = false
		player = body


func _on_death_body_entered(body):
	if body.name == "Player":
		death()

func death():
	queue_free()


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		PlayerHealth.health -= 1
