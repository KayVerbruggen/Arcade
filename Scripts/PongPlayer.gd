extends Node2D

var last_mouse_pos
var current_mouse_pos
var first = true
var speed = 600.0

func _ready():
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	current_mouse_pos = get_viewport().get_mouse_pos()
	
	if Input.is_action_pressed("move_up"):
		set_pos(Vector2( get_pos().x, get_pos().y - speed * delta))
	elif Input.is_action_pressed("move_down"):
		set_pos(Vector2( get_pos().x, get_pos().y + speed * delta))
	elif last_mouse_pos != current_mouse_pos and not first:
		set_pos(Vector2(get_pos().x, current_mouse_pos.y ))
		
	if get_pos().y < 0:
		set_pos(Vector2(get_pos().x, 0))
	elif get_pos().y > 600:
		set_pos(Vector2(get_pos().x, 600))
	
	first = false
	last_mouse_pos = current_mouse_pos