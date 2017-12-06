extends Control

var score_ai = 0
var score_player = 0
var speed = 0.5
var player_scored = false
var ai_scored = false

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if ai_scored and get_node("PCScored!").get_percent_visible() < 1:
		get_node("PCScored!").set_percent_visible(get_node("PCScored!").get_percent_visible() + speed * delta)
		
	if player_scored and get_node("PlayerScored!").get_percent_visible() < 1:
		get_node("PlayerScored!").set_percent_visible(get_node("PlayerScored!").get_percent_visible() + speed * delta)
		
	if player_scored == false and get_node("PlayerScored!").get_percent_visible() >= 1:
		get_node("PlayerScored!").set_percent_visible(get_node("PlayerScored!").get_percent_visible() - speed * delta)
		
	if ai_scored == false and get_node("PCScored!").get_percent_visible() >= 1:
		get_node("PCScored!").set_percent_visible(get_node("PCScored!").get_percent_visible() - speed * delta)
		
func set_score():
	if score_ai == 3 or score_player == 3:
		get_tree().change_scene("res://Scenes//StartMenu.xml")
	get_node("PlayerScore").set_text(String(score_player))
	get_node("AIScore").set_text(String(score_ai))