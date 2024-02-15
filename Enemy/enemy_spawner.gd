extends Node2D

@export var _spawn_resource: SpawnPoint

var enemy = preload("res://Enemy/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("spawn_enemy", _spawn_enemies)
	GameEvents.emit_signal("spawn_enemy", _spawn_resource)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _spawn_enemies(number_of_enemies):
	for i in _spawn_resource._spawn_points.size():
		var new_enemy = enemy.instantiate()
		new_enemy.initialize(_spawn_resource._spawn_points[i].x, _spawn_resource._spawn_points[i].y)
		add_child(new_enemy)
