extends Node2D

var speed = 200.0
var offset = 1.04

func _ready():
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	if get_node("../Ball").get_pos().y * offset > get_pos().y:
		set_pos(Vector2(get_pos().x, get_pos().y + speed * delta))
		
	if get_node("../Ball").get_pos().y * offset < get_pos().y:
		set_pos(Vector2(get_pos().x, get_pos().y - speed * delta))
