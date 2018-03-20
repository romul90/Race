extends RigidBody2D

const DELETE_DISTANCE = 1100

var _player = null
var _speed_factor = 1

func _ready():
	_player = get_node("../Player")
	add_to_group("block")
	set_process(true)

func _process(delta):
	position = (self.position + Vector2(0, _player.speed * _speed_factor * delta))
	
	if position.y > DELETE_DISTANCE:
		self.queue_free()
	
func hit_by_player():
	set_process(false)