extends AnimatedSprite

var velocity = Vector2(3, 0)

func _ready():
	set_process(true)

func _process(delta):
	set_pos(get_pos() + velocity)