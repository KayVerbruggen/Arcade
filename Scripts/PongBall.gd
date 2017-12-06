extends RigidBody2D

var velocity = 50.0
var max_velocity = 450.0
var y_offset = 1.2

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("paddle_top"):
			get_node("..//SamplePlayer").play("hit_paddle")
			handle_top_paddle()
			
		if body.is_in_group("paddle_bottom"):
			get_node("..//SamplePlayer").play("hit_paddle")
			handle_bottom_paddle()
		
		if body.is_in_group("wall"):
			get_node("..//SamplePlayer").play("hit_barrier")
	
	if get_pos().x < 0:
		get_node("../GUI").score_ai += 1
		get_node("../GUI").set_score()
		set_pos(Vector2(400, 300))
		set_linear_velocity(Vector2(-200, 0))
	
	if get_pos().x > 800:
		get_node("../GUI").score_player += 1
		get_node("../GUI").set_score()
		set_pos(Vector2(400, 300))
		set_linear_velocity(Vector2(200, 0))
		
func handle_top_paddle():
	if get_linear_velocity().y > (max_velocity - velocity * y_offset):
		set_linear_velocity(Vector2(get_linear_velocity().x, -max_velocity * y_offset))

	elif get_linear_velocity().y < (-max_velocity + velocity  * y_offset):
		set_linear_velocity(Vector2(get_linear_velocity().x, -max_velocity * y_offset))

	elif get_linear_velocity().x < (-max_velocity + velocity):
		set_linear_velocity(Vector2(-max_velocity, -abs(get_linear_velocity().y) * y_offset))

	else:
		set_linear_velocity(Vector2(get_linear_velocity().x + velocity, -abs(get_linear_velocity().y) - velocity * y_offset))
		
func handle_bottom_paddle():
	if get_linear_velocity().y > (max_velocity - velocity * y_offset):
		set_linear_velocity(Vector2(get_linear_velocity().x, max_velocity * y_offset))

	elif get_linear_velocity().y < (-max_velocity + velocity * y_offset):
		set_linear_velocity(Vector2(get_linear_velocity().y, max_velocity * y_offset))

	elif get_linear_velocity().x < (-max_velocity + velocity):
		set_linear_velocity(Vector2(-max_velocity, abs(get_linear_velocity().y) * y_offset))

	else:
		set_linear_velocity(Vector2(get_linear_velocity().x + velocity, abs(get_linear_velocity().y) + velocity * y_offset))