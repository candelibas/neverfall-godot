extends StaticBody2D

onready var right  = get_node("right")
onready var camera = get_node("/root/Node/camera")

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	if camera == null: return
	
	if right.get_global_pos().x <= camera.get_total_pos().x:
		queue_free()
	pass
