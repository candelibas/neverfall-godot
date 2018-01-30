extends Camera2D

onready var player = get_node("../player")

func _ready():
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	set_pos(Vector2(player.get_pos().x, get_pos().y))
	pass
	
func get_total_pos():
	return get_pos() + get_offset()
	pass