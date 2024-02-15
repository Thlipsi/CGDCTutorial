extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Health: " + str(PlayerHealth.health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Health: " + str(PlayerHealth.health)
