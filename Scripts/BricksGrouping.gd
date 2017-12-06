extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	for child in get_children():
		child.add_to_group("bricks")
	pass
