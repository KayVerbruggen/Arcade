extends Button

func _ready():
	set_pressed(true)
	pass
	
func _pressed():
	get_node("../SamplePlayer").play("button_click")
	get_tree().change_scene("res://Scenes//Breakout.xml")
