extends RigidBody2D

const MAXSPEED = 400.0
var speed_up = 40.0

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("paddle"):
			get_node("..//SamplePlayer").play("hit_paddle")
			var speed = get_linear_velocity().length()
			var dir = get_pos() - body.get_node("Ancor").get_global_pos()
			var velocity = dir.normalized() * min(speed + speed_up , MAXSPEED)
			set_linear_velocity(velocity)
			
		if body.is_in_group("bricks"):
			get_node("..//SamplePlayer").play("hit_brick")
			body.queue_free()
			get_node("..").check_bricks()
		
		if body.is_in_group("wall"):
			get_node("..//SamplePlayer").play("hit_barrier")
	
	if get_pos().x > 830:
		get_node("../GUI").score_player += 1
		get_node("../GUI").player_scored = true
		get_node("../GUI").set_score()
		set_pos(Vector2(400, 300))
		set_linear_velocity(Vector2(100, 0))
	
	if get_pos().x < -30:
		get_node("../GUI").score_ai += 1
		get_node("../GUI").ai_scored = true
		get_node("../GUI").set_score()
		set_pos(Vector2(400, 300))
		set_linear_velocity(Vector2(-100, 0))