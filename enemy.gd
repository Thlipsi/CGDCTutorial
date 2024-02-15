extends CharacterBody2D

var player
var chase = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var SPEED = 300

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if chase:
		var direction = (player.position - self.position).normalized()
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, -10)
	move_and_slide()


func _on_enemy_sense_body_entered(body):
	if body.name == "Player":
		chase = true
		player = body


func _on_enemy_sense_body_exited(body):
	if body.name == "Player":
		chase = false
