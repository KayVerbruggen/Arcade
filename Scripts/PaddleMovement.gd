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
	
	if Input.is_action_pressed("move_left"):
		set_pos(Vector2(get_pos().x - speed * delta, get_pos().y))
	elif Input.is_action_pressed("move_right"):
		set_pos(Vector2(get_pos().x + speed * delta, get_pos().y))
	elif last_mouse_pos != current_mouse_pos and not first:
		set_pos(Vector2(current_mouse_pos.x, get_pos().y))
		
	if get_pos().x < 0:
		set_pos(Vector2(0, get_pos().y))
	elif get_pos().x > 800:
		set_pos(Vector2(800, get_pos().y))
	
	first = false
	last_mouse_pos = current_mouse_pos