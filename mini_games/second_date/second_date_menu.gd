extends Node

var scene = load ("res://mini_games/second_date/second_date_game.tscn")

@export_file( "*.dtl") var dialogue_one

var player_move_left
var player_move_right
var player_move_up
var player_move_down

func _ready():
	disable_player_movement()

func disable_player_movement():
	player_move_left = InputMap.action_get_events("move_left")
	player_move_right = InputMap.action_get_events("move_right")
	player_move_up = InputMap.action_get_events("move_up")
	player_move_down = InputMap.action_get_events("move_down")
	InputMap.action_erase_events("move_left")
	InputMap.action_erase_events("move_right")
	InputMap.action_erase_events("move_up")
	InputMap.action_erase_events("move_down")

func enable_player_movement():
	for input_event in player_move_left:
		InputMap.action_add_event("move_left", input_event)
	for input_event in player_move_right:
		InputMap.action_add_event("move_right", input_event)
	for input_event in player_move_up:
		InputMap.action_add_event("move_up", input_event)
	for input_event in player_move_down:
		InputMap.action_add_event("move_down", input_event)

func _on_start_pressed():
	Dialogic.start(dialogue_one)
	await Dialogic.timeline_ended
	var scene_instance = scene.instantiate()
	add_child(scene_instance)
	

func _on_quit_pressed():
	enable_player_movement()
	queue_free()
