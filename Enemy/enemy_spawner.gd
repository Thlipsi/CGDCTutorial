extends Node2D

@export var _spawn_resource: SpawnPoint

# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("spawn_enemy", _spawn_enemies)
	GameEvents.emit_signal("spawn_enemy", _spawn_resource)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _spawn_enemies(number_of_enemies):
	var _enemy_values = _spawn_resource._enemy_values
	for i in _enemy_values.size():
		var _spawn_point = _enemy_values[i].spawn_point
		var new_enemy = _enemy_values[i].enemy_type.instantiate()
		new_enemy.initialize(_spawn_point.x, _spawn_point.y)
		add_child(new_enemy)
