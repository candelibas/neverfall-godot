
extends Camera2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process(true)
	# Load BlockFactory for blocks
	var factory = preload("res://Assets/Scenes/Block/BlockFactory.tscn").instance()
	
	# Add blocks to scene
	var newBlock = factory.generate_block(0)
	newBlock.set_pos(Vector2(70, 550))
	add_child(newBlock)
	
	newBlock = factory.generate_block(1)
	newBlock.set_pos(Vector2(150, 500))
	add_child(newBlock)
	
	newBlock = factory.generate_block(2)
	newBlock.set_pos(Vector2(250, 450))
	add_child(newBlock)
	
func _process(delta):
	#var pos = get_pos()
	#set_pos(Vector2(pos.x + 1, pos.y))