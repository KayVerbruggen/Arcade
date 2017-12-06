extends Node2D

func _ready():
	set_process_input(true)
	pass
	
func _input(event):
	if event.is_action_pressed("quit_app"):
		get_tree().quit()
		
func check_bricks():
	if get_tree().get_nodes_in_group("bricks").size() == 1:
		get_tree().change_scene("res://Scenes//StartMenu.xml")