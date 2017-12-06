extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_pressed(true)
	pass
	
func _pressed():
	get_node("../SamplePlayer").play("button_click")
	get_tree().change_scene("res://Scenes//Pong.xml")
